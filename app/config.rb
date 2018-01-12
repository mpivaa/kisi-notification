Mail.defaults do
  delivery_method :smtp, 
    address: 'smtp.sendgrid.net',
    port: '587',
    user_name: ENV['SMTP_USERNAME'],
    password: ENV['SMTP_PASSWORD']
end

SuckerPunch.logger = Logger.new('log/jobs.log')
