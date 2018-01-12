require './test/test_helper'

class MailerJobTest < MiniTest::Test
  def test_mailing
    Mail::TestMailer.deliveries.clear

    {
      to: 'test@email.com',
      subject: 'message',
      body: 'body'
    }.tap do |config|
      MailerJob.new.perform(config)
    end

    assert Mail::TestMailer.deliveries.length === 1, 'Mail not sent'
  end
end
