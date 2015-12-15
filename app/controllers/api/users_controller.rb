class Api::UsersController < Api::BaseController
  respond_to :json
  
  def show
    @user = User.where(id: params[:id])
    if @user.present?
      render json: @user.as_json, status: 200
    else
      render json: { error: true, error_messages: { user: ["User not found"] } }, status: 404
    end
  end
  
  protected
  
  def registrations_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
