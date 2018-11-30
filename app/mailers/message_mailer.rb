class MessageMailer < ApplicationMailer
  default from: "voloappheroku@gmail.com"
  layout "mailer"

  def send_message(recipient, message)
    @message = message
    @recipient = recipient
    mail(to: @recipient, subject: 'Sample Email', body: 'Some text')
  end
end
