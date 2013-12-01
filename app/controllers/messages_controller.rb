class MessagesController < ApplicationController
  def index
    @received_messages = current_user.received_messages.order_by(:created_at.desc)
    @sent_messages = current_user.sent_messages.order_by(:created_at.desc)
  end

  def new
    @message = Message.new(recipient: params[:recipient])
  end

  def create
    begin
      recipient = User.find_by(nickname: params[:message][:recipient])
    rescue Mongoid::Errors::DocumentNotFound
      recipient = nil
    end

    @message = Message.new(message_params)
    @message.sender = current_user
    @message.recipient = recipient

    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end

  private

    def message_params
      params.require(:message).permit(:content)
    end
end
