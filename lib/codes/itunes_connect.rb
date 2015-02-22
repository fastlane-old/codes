require 'fastlane_core/itunes_connect/itunes_connect'
require 'deliver'
require 'deliver/app'

module FastlaneCore
  class ItunesConnect

    PROMO_URL = "https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/wa/LCAppPage/viewPromoCodes?adamId="

    def run(args)
      number_of_codes = args[:number_of_codes]

      code_or_codes = number_of_codes == 1 ? "code" : "codes"
      Helper.log.info "Downloading #{number_of_codes} promo #{code_or_codes}..." if number_of_codes == 1

      app = Deliver::App.new(args.drop(:number_of_codes))
      Helper.log.debug "Found App: #{app.to_s}"

      file_name = ["codes", args[:app_identifier]].join("_") + ".txt"
      output_file_path = File.join(Dir.getwd, file_name)
      raise "Insufficient permissions to write to codes.txt file".red if File.exists?(output_file_path) and not File.writable?(output_file_path)

      visit PROMO_URL << app.apple_id.to_s

      text_fields = wait_for_elements "input[type=text]"
      raise "There should only be a single text input field to specify the number of codes".red unless text_fields.count == 1

      text_fields.first.set(number_of_codes.to_s)
      click_next
      Helper.log.debug "Accepting the App Store Volume Custom Code Agreement"
      wait_for_elements("input[type=checkbox]").first.click
      click_next

      # the find(:xpath, "..") gets the parent element of the previous expression
      download_url = wait_for_elements("a > img").first.find(:xpath, '..')['href'] 


      codes = download_codes download_url
      
      bytes_written = File.write(output_file_path, codes, mode: "a+")
      Helper.log.warn "Could not write your codes to the codes.txt file, but you can still access them from iTunes Connect later" if bytes_written == 0
      Helper.log.info "Added generated codes to '#{output_file_path}'".green unless  bytes_written == 0

      Helper.log.info "Your codes were succesfully downloaded:".green
      puts codes
    end

    def click_next
      wait_for_elements("input.continueActionButton").first.click
    end

    def download_codes(url)
      host = Capybara.current_session.current_host
      url = URI.join(host, url)
      Helper.log.debug "Downloading promo code file from #{url}"

      cookie_string = ""
      page.driver.cookies.each do |key, cookie|
        cookie_string << "#{cookie.name}=#{cookie.value};"
      end

      open(url, "Cookie" => cookie_string).read
    end

  end
end
