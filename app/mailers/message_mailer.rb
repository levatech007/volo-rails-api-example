class MessageMailer < ApplicationMailer
  default from: ENV['GMAIL_USERNAME']

  def message_mailer(recipient, message) #function name must match the mailer layout name to render it automatically
    @message = message
    @recipient = recipient
    mail(to: @recipient, subject: "Message from #{ @message.name }")
  end
end
