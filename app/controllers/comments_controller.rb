class CommentsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@goal = @user.goals.find(params[:goal_id])
	    @comments = @goal.comments.all
	end

	def create
		@user = User.find(params[:user_id])
		@goal = @user.goals.find(params[:goal_id])
		@comment = @goal.comments.new(base_params)
		if @comment.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def update

	end

	def destroy
		@user = User.find(params[:user_id])
		@goal = @user.goals.find(params[:goal_id])
		@comments = @goal.comments.find(params[:id])
		@comments.destroy
		redirect_to root_path
	end

	private
	def base_params
		return params.require(:comment).permit(:goal_id, :comments_word, :super_manager_id, :manager_id)
	end
end
