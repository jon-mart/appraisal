class UsersController < ApplicationController

	def index
		@users = User.all
		
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(base_params)
		if @user.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])

		if @user.update(base_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		redirect_to root_path
	end


	private
	def base_params
		return params.require(:user).permit(:name, :salary, :contact,:role, :manager_id, :super_manager_id)
	end

end
