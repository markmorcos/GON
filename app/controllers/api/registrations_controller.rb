class Api::RegistrationsController < Api::BaseController
  respond_to :json
  
  # curl -v -H "Accept: application/json" -H "Content-type: applicaion/json" -X POST -d '{"user":{"email":"mark.yehia@gmail.com"}}' http://localhost:3000/api/users/check_email
  def check_email
    @user = User.where(params.require(:registration).permit(:email))
    if @user.nil?
      render json: { success: true }, status: 200
    else
      render json: { error: true, error_messages: { email: ["Email has already been taken"] } }, status: 422
    end
  end
  
  # curl -v -H "Accept: application/json" -H "Content-type: applicaion/json" -X POST -d '{"user":{"email":"mark.yehia@gmail.com"}}' http://localhost:3000/api/users/check_email
  def create
    @user = User.new(registrations_params)
    if @user.save
      render json: @user.as_json(auth_token: @user.authentication_token, email: @user.email, password: @user.password, last_name: @user.last_name, first_name: @user.first_name), status: 200
    else
      # warden.custom_failure!
      render json: { error: true, error_messages: @user.errors }, status: 422
    end
  end
  
  protected
  
  def registrations_params
    params.require(:registration).permit(:email, :password, :first_name, :last_name)
  end
end
