# frozen_string_literal: true

class Messages::ConversationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @conversation = Mailboxer::Conversation.find(params[:id])
    authorize @conversation
    @receipts = @conversation.receipts_for current_user
    @conversation.mark_as_read(current_user)
  end

  def new; end

  def create
    authorize Mailboxer::Conversation
    recipient = User.find(conversation_params[:recipient])
    if receipt = current_user.send_message(recipient, conversation_params[:body], conversation_params[:subject])
      redirect_to messages_conversation_url(receipt.conversation), notice: 'Message sent.'
    else
      render :new
    end
  end

  def reply
    @conversation = Mailboxer::Conversation.find(params[:id])
    authorize @conversation
    if current_user.reply_to_conversation(@conversation, reply_params[:body])
      redirect_to messages_conversation_url(@conversation)
    else
      render :show
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body, :recipient)
  end

  def reply_params
    params.require(:reply).permit(:body)
  end
end
