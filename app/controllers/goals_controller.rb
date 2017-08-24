class GoalsController < ApplicationController
	def index
		@users = User.find(params[:user_id])
		@goals = @users.goals.all
		
	end

	def show
		@user = User.find(params[:user_id])
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:user_id])
	end

	def create
		@user = User.find(params[:user_id])
		@goals = @users.goals.create(base_params)
		if @user.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:user_id])
	end

	def destroy
		@users = User.find(params[:user_id])
		@goals = @users.goals.find(params[:id]).destroy
		redirect_to root_path
	end


	private
	def base_params
		return params.require(:goal).permit(:name, :details, :status,:user_id)
	end
end
