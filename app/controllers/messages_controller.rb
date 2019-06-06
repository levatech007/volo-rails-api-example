# handles contact form processing
class MessagesController < ApplicationController

  def create
      @message = Message.new(message_params)
      @recipient = ENV['GMAIL_USERNAME']
      # validate params!!!

      if @message.valid?
        MessageMailer.message_mailer(@recipient, @message).deliver_now
        render json: {result: 'Successfully submitted'}, status: :ok
      else
        #send error
      end
    end

  private
  def message_params
      params.require(:message).permit(:name, :email, :body)
  end

end
