class MessagesController < ApplicationController

  def create
      @message = Message.new(message_params)
      @recipient = ENV['GMAIL_USERNAME']
      p(@message)
      if @message.valid?
        MessageMailer.send_message(@recipient, @message).deliver_now
        # return ok
      else
        #send error
      end
    end

  private
  def message_params
      params.require(:message).permit(:name, :email, :body)
  end

end
