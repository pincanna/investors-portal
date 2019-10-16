class Api::V1::BaseController < ActionController::Base
  before_action :doorkeeper_authorize!

  # Find the user that owns the access token
  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
