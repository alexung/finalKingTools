class UserMailer < ApplicationMailer
  include SendGrid
  default to: 'alexung.ucsb@gmail.com'
  sendgrid_category :use_subject_lines
  sendgrid_enable   :ganalytics, :opentrack
  sendgrid_unique_args :key1 => "value1", :key2 => "value2"

  def welcome_email()
    sendgrid_category "Welcome"
    sendgrid_unique_args :key2 => "newvalue2", :key3 => "value3"
    @user = 'alexung.ucsb@gmail.com'
    mail :to => @user, :subject => "Inquiry via KingToolsCorp from #{@user}"
  end

  def receive(email)
    page = Page.find_by(address: email.to.first)
    page.emails.create(
      subject: email.subject,
      body: email.body
    )
  end

end
