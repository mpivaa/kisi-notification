if ENV['RACK_ENV'] === 'test' || ENV['RACK_ENV'] === 'development'
  require 'dotenv/load'
end
require 'sucker_punch'
require 'sinatra'
require 'mail'
require_relative 'config'
require_relative 'notification_service'
require_relative 'rule'
require_relative 'mailer_job'

rules = [
  Rule.new(filters: {
    success: false,
    action: 'unlock'
  }, subscribers: ['m.pivaa@gmail.com'])
]

post '/events' do
  event = JSON.parse(request.body.read, symbolize_names: true)
  service = NotificationService.new(event, rules)
  if service.notify
    status 200
  else
    status 400
  end
end
