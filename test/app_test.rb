require './test/test_helper'

class AppTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_incoming_event
    post '/events', JSON.dump(Fixtures.event_payload)
    assert last_response.ok?
  end

  def test_bad_incoming_event
    assert_raises do
      post '/events' 
    end
  end
end
