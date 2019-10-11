class Messages::InboxController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = current_user.mailbox.inbox
  end
end
