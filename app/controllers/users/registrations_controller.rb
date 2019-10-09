class Users::RegistrationsController < Devise::RegistrationsController
  def new
    redirect_to controller: 'devise/sessions', action: 'new'
  end
  def create
    render plain: 'This is not allowed.'
  end
end