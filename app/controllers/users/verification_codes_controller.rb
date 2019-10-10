class Users::VerificationCodesController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where("paranoid_verification_code IS NOT NULL")
    redirect_to root_path, notice: "You don't have access." unless current_user.has_role?(:verifier)
  end
end
