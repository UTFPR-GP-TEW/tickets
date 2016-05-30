ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
if ENV['SIMPLECOV'] == 'simplecov'
  require 'simplecov'
  SimpleCov.start 'rails'
else
  require 'coveralls'
  Coveralls.wear!('rails')
end

require 'rails/test_help'

class ActionController::TestCase
  include Devise::TestHelpers
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
