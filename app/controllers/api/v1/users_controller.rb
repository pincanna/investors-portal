# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::BaseController
  respond_to :json
  def me
    respond_with current_resource_owner
  end
end
