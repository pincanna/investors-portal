class Messages::ConversationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @conversation = Mailboxer::Conversation.find(params[:id])
    @receipts = @conversation.receipts_for current_user
  end

  def reply
    @conversation = Mailboxer::Conversation.find(params[:id])
    if current_user.reply_to_conversation(@conversation, reply_params[:body])
      redirect_to messages_conversation_url(@conversation)
    else
      render :show
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:body)
  end
end
