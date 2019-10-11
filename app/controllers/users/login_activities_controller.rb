class Users::LoginActivitiesController < ApplicationController
  before_action :authenticate_user!
  def index
    @login_activities = current_user.login_activities
  end
end
