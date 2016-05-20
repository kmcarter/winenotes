class UserMailer < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.thank_you.subject
  #
  
  def thank_you(user)
    @user = user
    @greeting = "Hi"

    mail(to: @user.email, subject: "Thanks for signing up")
  end
  
  def test_email(email)
    mail(to: email, subject: "Testing Active Job Mailer")
  end
end
