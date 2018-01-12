ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require './test/fixtures'
require './app/app'
require 'sucker_punch/testing/inline'

Mail.defaults do
  delivery_method :test
end
