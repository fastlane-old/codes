module Codes
  class CodesRunner
    def self.run(args)
      Codes::ItunesConnect.new.run args
    end
  end
end
