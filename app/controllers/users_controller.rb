class UsersController < ApplicationController
	layout 'application', include: :destroy_select_user
	before_action :authenticate_user!, :except => [:managers]

	protect_from_forgery prepend: true

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
		# p @user
		# binding.pry

		@user.destroy

		redirect_to root_path
	end

	def destroy_select_user

		  t = params[:bulk_user_ids]
		  # binding.pry
		  @users = []

		  if  t.nil?
		    redirect_to 'index'
		  else
		    # if temp[:role] == 'sm'
		    # 	render js: "confirm('Warning: deleteing Super Manager??')"
		    # end
		    @users =  User.where id: t.to_a
		    if @users.count == 0
		 	  render js: 'No User is selected'	
		    end
		  end
		  # binding.pry
		  if params[:confirm] == 'true'
		  	@users.destroy_all
		  end


	end

	def managers
		@user = User.where(role: 'm')
		render json: @user
	end

	def after_sign_up_path_for
      redirect_to new_user_path
    end

	private
	def base_params
		return params.require(:user).permit(:name, :salary, :contact,:role, :manager_id, :super_manager_id, :bulk_user_id)
	end

end
