class Contact < MailForm::Base
  def headers
    {
      :subject => "test",
      :to => "alexung.ucsb@gmail.com",
      :from => "alexung.ucsb@gmail.com"
    }
end
