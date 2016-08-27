require './lib/issue_centre'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |cassette|
  cassette.cassette_library_dir = "test/fixtures"
  cassette.hook_into :webmock
end
