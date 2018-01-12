class NotificationService
  def initialize(event, rules)
    @event = event
    @rules = rules
  end

  def notify
    @rules.map do |rule|
      if rule.match?(@event)
        send_mail(@event, rule)
      end
    end
  end

  private
  def send_mail(event, rule)
    rule.subscribers.map do |subscriber|
      {
        to: subscriber,
        subject: event[:message],
        body: build_body(subscriber, event[:message])
      }.tap do |mail|
        MailerJob.perform_async(mail)
      end
    end
  end

  def build_body(email, message)
    template = ERB.new(File.open("#{__dir__}/templates/mail.erb").read)
    template.result(binding)
  end
end
