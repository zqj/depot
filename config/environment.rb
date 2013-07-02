# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Depot::Application.initialize!

Depot::Application.configure do
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address:        "smtp.qq.com",
    port:           25,
    domain:         "domain.mail.qq.com",
    authentication: "plain",
    user_name:      "23988848@qq.com",
    password:       "yingxiong002",
    enable_starttls_auto: true
  }
end
