ENV["DATABASE_URL"] ||= 'postgres://localhost/qwubble_test'
ENV["RACK_ENV"] ||= 'test'

require 'rubygems'
require 'bundler/setup'
require 'goliath/test_helper'
require 'qwubble'

Bundler.require :default, :test

RSpec.configure do |config|
  config.mock_with :rspec
  config.expect_with :rspec
end

RSpec.configure do |c|
  c.include Goliath::TestHelper, :example_group => {
    :file_path => /spec\/resources/
  }
end
