class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@winenotes.io"
  layout 'mailer'
end
