class Api::CommentsController < Api::BaseController
	
	respond_to :json

	def create
		@comment = Comment.new
		@comment.user_id = params[:id]
		@comment.post_id = params[:post_id]
		@comment.text = params[:text]
		if @comment.save
			render json: @commment
		else
			render json: { error: true, error_messages: @comment.errors }
		end
   	    # @post.latitude = params[:latitude]
    	# @post.longitude = params[:longitude]
		# @post.image = params[:image]
	end
end
