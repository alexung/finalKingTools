ActionMailer::Base.smtp_settings = {
        :address                        => "smtp.sendgrid.com",
        :port                                        => 587,
        :user_name                 => ENV['SENDGRID_USERNAME'],
        :password                 => ENV['SENDGRID_PASSWORD'],
        :authenticaton => "plain",
        :enable_starttls_auto => true
}
