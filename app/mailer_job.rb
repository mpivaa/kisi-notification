class MailerJob
  include SuckerPunch::Job

  def perform(config)
    Mail.deliver do
      from     ENV['FROM_EMAIL']
      to       config[:to]
      subject  config[:subject]
      body     config[:body]
    end
  end
end
