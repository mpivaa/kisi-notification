require 'test/test_helper.rb'

class AppTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_incoming_event
    post '/events', Fixtures.event_payload
    assert last_response.ok?
    assert_equal "Hello, World!", last_response.body
  end
end
