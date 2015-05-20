module Codes
  class CodesRunner
    def self.download(args)
      Codes::ItunesConnect.new.download args
    end
  end
end
