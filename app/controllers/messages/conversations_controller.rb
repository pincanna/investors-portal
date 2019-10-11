class Messages::ConversationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @conversation = Mailboxer::Conversation.find(params[:id])
    @receipts = @conversation.receipts_for current_user
  end
end
