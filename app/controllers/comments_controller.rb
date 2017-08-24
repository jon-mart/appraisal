class CommentsController < ApplicationController
	def index
		@goals = Goal.find(params[:goal_id])
	    @comments = @goals.comments.all
	end

	def show
		@goal = Goal.find(params[:goal_id])
	end

	def new
		@goal = Goal.new
	end

	def edit
		@goal = Goal.find(params[:goal_id])
	end

	def create
		@goal = Goal.new(base_params)
		if @goal.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def update
		@goal = Goal.find(params[:goal_id])

		if @goal.update(base_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		@goal = Goal.find(params[:goal_id])
		redirect_to root_path
	end


	private
	def base_params
		return params.require(:goal).permit()
	end
end
