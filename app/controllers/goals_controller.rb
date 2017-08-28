class GoalsController < ApplicationController
	# @@user_id = 0
	def index
		@user = User.find(params[:user_id])
		@goals = @user.goals.all
	end

	def show
		@user = User.find(params[:user_id])
		@goal = @user.goals.find(params[:id])
	end

	def new
		@user = User.find(params[:user_id])
		@goal = @user.goals.new

		# binding.pry
	end

	def edit
		@user = User.find(params[:user_id])
		@goal = user.goals.find params[:id]
	end

	def create
		@user = User.find(params[:user_id])
		# binding.pry
		@goal = @user.goals.new(base_params)
		if @goal.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:user_id])
		@goal = @users.goals.find params [:id]
		if @goal.update(base_params)
			redirect_to 'index'
		else
			render 'edit'
		end
	end

	def destroy
		@users = get_current_user()
		@goal = @users.goals.find(get_current_goal_id)
		@goal.destroy	
		redirect_to root_path
	end

	def user_goals_index
		@goals = User.find(params[:user_id]).goals
		render json: @goals
	end



	private
	def base_params
		return params.require(:goal).permit(:name, :details, :status,:user_id)
	end

	def get_current_user
		User.find(params[:user_id])
	end

	def get_current_goal_id
		params[:id]
	end
end
