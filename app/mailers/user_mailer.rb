class UserMailer < ApplicationMailer
  default from: 'edifi.team@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Edifi!')
  end

  def message_email(recipient)
    @recipient = recipient
    mail(to: @recipient.email, subject: 'You have a new message on Edifi!')
  end

  def connection_email(teacher)
      @teacher = teacher
      mail(to: @teacher.email, subject: 'You have a connection request on Edifi!')
  end
end
