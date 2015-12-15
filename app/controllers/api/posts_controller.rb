class Api::PostsController < Api::BaseController
	
	respond_to :json

	def create
		@post = Post.new
		@post.user_id = params[:id]
		@post.other_user_id = 0
		@post.other_user_id = params[:other_user_id] if params[:other_user_id] != 0
		@post.text = params[:text]
		if @post.save
			render json: @post
		else
			render json: { error: true, error_messages: @post.errors }
		end
   	    # @post.latitude = params[:latitude]
    	# @post.longitude = params[:longitude]
		# @post.image = params[:image]
	end
end
