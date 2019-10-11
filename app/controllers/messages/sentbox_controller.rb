class Messages::SentboxController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = current_user.mailbox.sentbox
  end
end
