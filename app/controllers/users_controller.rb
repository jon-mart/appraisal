class UsersController < ApplicationController
	
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@@users_id = @user
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
		# p @user
		# binding.pry

		@user.destroy


		redirect_to root_path
	end

	def managers
		@user = User.where(role: 'm')
		render json: @user
	end


	def users_list
		@users = User.all
		render json: @users
	end

	private
	def base_params
		return params.require(:user).permit(:name, :salary, :contact,:role, :manager_id, :super_manager_id)
	end

end
