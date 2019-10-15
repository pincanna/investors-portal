class Users::DirectoryController < ApplicationController
  before_action :authenticate_user!
  def index
    @directory = User.all.order(last_name: :asc, first_name: :asc)
  end
end
