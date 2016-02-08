class UserMailer < ApplicationMailer
  default from: 'edifi.team@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Edifi!')
  end
end
