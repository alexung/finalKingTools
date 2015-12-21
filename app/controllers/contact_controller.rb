class ContactController < ApplicationController
  require 'mail'
  protect_from_forgery

  def index
    # mail = Mail.new do
    #   to "alexung.ucsb@gmail.com"
    # end

    # mail['from'] = 'alexung.ucsb@gmail.com'
    # mail.subject = 'This is a test email'
    # mail.body = 'lolololololol'

    # mail.header['X-Custom-Header'] = 'custom value'

    # mail.to_s
    UserMailer.welcome_email().deliver_now!
    @q = Product.ransack(params[:q])
    @product = @q.result.paginate(:page => params[:page], :per_page => 9)

  end

  def sent
    # mail = Mail.new do
    #   to "alexung.ucsb@gmail.com"
    # end

    # mail['from'] = 'alexung.ucsb@gmail.com'
    # mail.subject = 'This is a test email'
    # mail.body = 'lolololololol'

    # mail.header['X-Custom-Header'] = 'custom value'

    # mail.to_s
      UserMailer.welcome_email().deliver_now!

      # format.html { redirect_to('alexung.ucsb@gmail.com', notice: 'Email successfully sent.') }
      # format.json { render json: 'alexung.ucsb@gmail.com', status: :created, location: 'alexung.ucsb@gmail.com'}
  end

end
