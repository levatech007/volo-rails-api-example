class MessageMailer < ApplicationMailer
  default from: ENV['VOLO_USERNAME']

  def send_message(recipient, message)
    @message = message
    @recipient = recipient
    mail(to: @recipient, subject: 'Sample Email')
  end
end
