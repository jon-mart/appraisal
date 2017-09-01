class UsersController < ApplicationController
	layout 'application', include: :destroy_select_user

	before_action :authenticate_member!

	protect_from_forgery prepend: true

	def index

		user =  User.find_by member_id: current_member.id
		if user.role == 'e'
			@users = [user]
		elsif user.role == 'm'
			@users = User.where(manager_id: user)
		elsif user.role == 'sm'
			@users = User.all
		end
		# binding.pry
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

		  if  t.nil? or current_member.user.role == 'e'
		  	# binding.pry
		    redirect_to root_path
		    # p 'redirect_to index'
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
		  if params[:commit] == 'Comfirm'
		  	# binding.pry
		  	@users.destroy_all
		  	# render js: 'alert("Selected user has been deleted");'
		  	redirect_to root_path
		  end


	end

	def managers
		@user = User.where(role: 'm')
		render json: @user
	end

	private
	def base_params
		# binding.pry
		return params.require(:user).permit(:name, :salary, :contact,:role, :manager_id, :super_manager_id, :member_id, :gender)
	end

end
