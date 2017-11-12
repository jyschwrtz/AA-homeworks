class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = 'http://99Cats.com/login'
    mail(to: 'j@mail.com', subject: 'Welcome to my Awesome Site')
  end

end
