require 'codes/version'
require 'codes/dependency_checker'
require 'codes/codes_runner'
require 'codes/itunes_connect'

require 'fastlane_core'

module Codes
  Helper = FastlaneCore::Helper

  DependencyChecker.check_dependencies
end
