module Codes
  class CodesRunner
    def self.download(args)
      Codes::ItunesConnect.new.download args
    end
    def self.display(args)
      Codes::ItunesConnect.new.display args
    end
  end
end
