module Codes
  class CodesRunner
    def self.run args
      FastlaneCore::ItunesConnect.new.run
    end
  end
end
