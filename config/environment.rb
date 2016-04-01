# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Depot::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:    "smtp.gmail.com",
    port:    587,
    domain:    "testingruby123@gmail.com",
    authentication: "plain",
    user_name:    "Ruby",
    password:    "testingruby123",
    enable_starttls_auto: true
  }
end
