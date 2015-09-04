require 'fastlane_core/itunes_connect/itunes_connect'

module Codes
  class ItunesConnect < FastlaneCore::ItunesConnect
    PROMO_URL = 'https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/wa/LCAppPage/viewPromoCodes?adamId=[[app_id]]&platform=[[platform]]'
    CODE_URL = 'https://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/redeemLandingPage?code=[[code]]'

    def download(args)
      number_of_codes = args[:number_of_codes]

      code_or_codes = number_of_codes == 1 ? 'code' : 'codes'
      Helper.log.info "Downloading #{number_of_codes} promo #{code_or_codes}..."

      fetch_app_data args

      # Use Pathname because it correctly handles the distinction between relative paths vs. absolute paths
      output_file_path = Pathname.new(args[:output_file_path]) if args[:output_file_path]
      output_file_path ||= Pathname.new(File.join(Dir.getwd, "#{@app_identifier || @app_id}_codes.txt"))
      fail 'Insufficient permissions to write to output file'.red if File.exist?(output_file_path) && !File.writable?(output_file_path)
      visit PROMO_URL.gsub('[[app_id]]', @app_id.to_s).gsub('[[platform]]', @platform)

      begin
        text_fields = wait_for_elements('input[type=text]')
      rescue
        raise "Could not open details page for app #{@app_identifier}. Are you sure you are using the correct apple account and have access to this app?".red
      end
      fail 'There should only be a single text input field to specify the number of codes'.red unless text_fields.count == 1

      text_fields.first.set(number_of_codes.to_s)
      click_next

      # are there any errors ?
      errors = []
      begin
        errors = wait_for_elements('div[id=LCPurpleSoftwarePageWrapperErrorMessage]')
      rescue
      end
      fail errors.first.text.red unless errors.count == 0

      Helper.log.debug 'Accepting the App Store Volume Custom Code Agreement'
      wait_for_elements('input[type=checkbox]').first.click
      click_next

      # the find(:xpath, "..") gets the parent element of the previous expression
      download_url = wait_for_elements("div[class='large-blue-rect-button']").first.find(:xpath, '..')['href']

      codes, request_date = download_codes(download_url)

      format = args[:format]
      codes = download_format(codes, format, request_date, app) if format

      bytes_written = File.write(output_file_path.to_s, codes, mode: 'a+')
      Helper.log.warn 'Could not write your codes to the codes.txt file, but you can still access them from iTunes Connect later' if bytes_written == 0
      Helper.log.info "Added generated codes to '#{output_file_path}'".green unless  bytes_written == 0

      Helper.log.info "Your codes (requested #{request_date}) were successfully downloaded:".green
      puts codes
    end

    def download_format(codes, format, request_date, app)
      format = format.gsub(/%([a-z])/, '%{\\1}') # %c => %{c}

      codes = codes.split("\n").map do |code|
        format % {
          c: code,
          b: app['bundleId'],
          d: request_date, # e.g. 20150520110716 / Cupertino timestamp...
          i: app['trackId'],
          n: "\'#{app['trackName']}\'",
          p: app_platform(app),
          u: CODE_URL.gsub('[[code]]', code)
        }
      end
      codes.join("\n") + "\n"
    end

    def app_platform(app)
      app['kind'] == 'mac-software' ? 'osx' : 'ios'
    end

    def display(args)
      Helper.log.info 'Displaying remaining number of codes promo'

      fetch_app_data args

      # Use Pathname because it correctly handles the distinction between relative paths vs. absolute paths
      output_file_path = Pathname.new(args[:output_file_path]) if args[:output_file_path]
      output_file_path ||= Pathname.new(File.join(Dir.getwd, "#{@app_identifier || @app_id}_codes_info.txt"))
      fail 'Insufficient permissions to write to output file'.red if File.exist?(output_file_path) && !File.writable?(output_file_path)
      visit PROMO_URL.gsub('[[app_id]]', @app_id.to_s).gsub('[[platform]]', @platform)

      begin
        text_fields = wait_for_elements('input[type=text]')
      rescue
        raise "Could not open details page for app #{app_identifier}. Are you sure you are using the correct apple account and have access to this app?".red
      end
      fail 'There should only be a single text input field to specify the number of codes'.red unless text_fields.count == 1

      remaining_divs = wait_for_elements('div#codes_0')
      fail 'There should only be a single text div containing the number of remaining codes'.red unless remaining_divs.count == 1
      remaining = remaining_divs.first.text.split(' ')[0]

      bytes_written = File.write(output_file_path.to_s, remaining, mode: 'a+')
      Helper.log.warn 'Could not write your codes to the codes_info.txt file, but you can still access them from iTunes Connect later' if bytes_written == 0
      Helper.log.info "Added information of quantity of remaining codes to '#{output_file_path}'".green unless bytes_written == 0

      puts remaining
    end

    def click_next
      wait_for_elements('input.continueActionButton').first.click
    end

    def download_codes(url)
      host = Capybara.current_session.current_host
      url = URI.join(host, url)
      Helper.log.debug "Downloading promo code file from #{url}"

      cookie_string = ''
      page.driver.cookies.each do |key, cookie|
        cookie_string << "#{cookie.name}=#{cookie.value};"
      end

      page = open(url, 'Cookie' => cookie_string)
      request_date = page.metas['content-disposition'][0].gsub(/.*filename=.*_(.*).txt/, '\\1')
      codes = page.read

      [codes, request_date]
    end

    private

    def fetch_app_data(args)
      @country = args[:country]
      @app_identifier = args[:app_identifier]

      @app_id = args[:apple_id]
      @app_id ||= (FastlaneCore::ItunesSearchApi.fetch_by_identifier(@app_identifier, @country)['trackId'] rescue nil)

      if @app_id.to_i == 0 || @app_identifier.to_s.length == 0
        fail "Could not find app using the following information: #{args}. Maybe the app is not in the store. Pass the Apple ID of the app as well!".red
      end

      app = FastlaneCore::ItunesSearchApi.fetch(@app_id, @country)
      @platform = app_platform app
    end
  end
end
