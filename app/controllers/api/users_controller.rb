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
  
  def change_name
		@user = User.find(params[:id])
		@user.first_name = params[:first_name]
		@user.last_name = params[:last_name]
		if @user.save
			render json: @user, status: 201
		else
			render json: {errors: @user.errors}, status: 422
		end
	end
	
	def friends
		@user = User.find(params[:id])
		render json: @user.friends.current, include: [:user, :other_user]
		
	end
	
	def news_feed
		@user = User.find(params[:id])
		render json: @user.posts_on_my_news_feed, include: [:user, :other_user]
	end

	
  	def pending
		@user = User.find(params[:id])
		render json: @user.friends.pending, include: [:user, :other_user]
	end
  
  def respond
		@request = Friend.find(params[:id])
		if (params[:accepted] == true)
			@request.accepted = true
			@request.save
		else
			@request.destroy
		end
  end
  
  def registrations_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
