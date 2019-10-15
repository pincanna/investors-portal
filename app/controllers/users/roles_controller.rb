class Users::RolesController < ApplicationController
  def create
    @user = User.find(params[:profile_id])
    if @user.add_role(role_params[:name])
      redirect_to users_profile_path(@user), notice: "Success!"
    else
      redirect_to users_profile_path(@user), notice: "Role was not added."
    end
  end

  private

  def role_params
    params.require(:role).permit(:name)
  end
end
