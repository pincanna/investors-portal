class Users::InvitationsController < Devise::InvitationsController
  before_action :authorize , only: [:new, :create]

  private

  def authorize
    redirect_to root_url, notice: 'You cannot do that' unless current_user.has_role?(:user_inviter)
  end
end