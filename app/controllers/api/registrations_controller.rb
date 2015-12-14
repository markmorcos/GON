class Api::RegistrationsController < Api::BaseController
  
  respond_to :json
  def create

    @user = User.new(params[:user,:first_name,:last_name,:password])
    if user.save
      render :json=> @user.as_json(:auth_token=>@user.authentication_token, :email=>@user.email
        ,:password=>@user.password,:last_name=>@user.last_name,:first_name=>@user.first_name), :status=>201
      respond_with @user
    else
      warden.custom_failure!
      render :json=> @user.errors, :status=>422
    end
  end
  def registrations_params
    params.require(:registration).permit(
      :first_name,:last_name,:email,:password)
  end
end