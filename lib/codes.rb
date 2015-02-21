require 'codes/version'
require 'codes/dependency_checker'
require 'codes/codes_runner'
require 'codes/itunes_connect'
require 'codes/hash_drop'

require 'fastlane_core'

module Codes
  Helper = FastlaneCore::Helper 

  FastlaneCore::UpdateChecker.verify_latest_version('codes', Codes::VERSION)
  DependencyChecker.check_dependencies
end
