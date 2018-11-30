class MessagesController < ApplicationController

  def create
      @message = Message.new(message_params)
      @recipient = ENV['GMAIL_USERNAME']
      p(@message)
      p(@recipient)

      if @message.valid?
        MessageMailer.send_message(@recipient, @message).deliver_now
        render json: {result: 'Successfully submitted'}, status: :ok
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
