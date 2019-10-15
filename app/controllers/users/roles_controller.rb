class Users::RolesController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = User.find(params[:profile_id])
    authorize Role
    if @user.add_role(role_params[:name])
      redirect_to users_profile_path(@user), notice: "Success!"
    else
      redirect_to users_profile_path(@user), notice: "Role was not added."
    end
  end

  def destroy
    @user = User.find(params[:profile_id])
    @role = Role.find(params[:id])
    authorize @role

    if @user.remove_role(@role.name)
      redirect_to users_profile_path(@user), notice: 'Role removed.'
    else
      redirect_to users_profile_path(@user), notice: 'Role could not be removed.'
    end
  end

  private

  def role_params
    params.require(:role).permit(:name)
  end
end
