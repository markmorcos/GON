class Api::SessionsController < Api::BaseController
  #prepend_before_filter :require_no_authentication, :only => [:create ]
  #include Devise::Controllers::InternalHelpers
  
  before_filter :ensure_params_exist

  respond_to :json
  
  def create
    #build_resource
    resource = User.find_for_database_authentication(email: params[:session][:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:session][:password])
      sign_in("user", resource)
      render json: resource
      return
    end
    invalid_login_attempt
  end
  
  def destroy
    sign_out(resource_name)
  end

  protected
  def session_params
    params.require(:session).permit(:email, :password,:first_name,:last_name)
  end

  def ensure_params_exist
    return unless params[:session].blank?
    render :json=>{:success=>false, :message=>"Either your username or password is missing!"}, :status=>422
  end

  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Either invalid email or password"}, :status=>401
  end
end
