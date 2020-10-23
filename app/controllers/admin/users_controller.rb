class Admin::UsersController < Admin::ApplicationController

	before_action  :find_users, only: [:index, :destroy]

	def index
	end

	def show
		@user = User.find(params[:id])
		@clients = Client.all
		@pending_tasks = Task.where.not(pending: [nil, ""]).where(done: false)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "Usuario creado satisfactoriamente."
			redirect_to admin_users_path
		else
			flash.now[:notice] = "Usuario no ha sido creado."
			render 'new'			
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(user_params)
			flash[:notice] = "Usuario editado correctamente."
			redirect_to admin_users_path
		else
			flash.now[:notice] = "Usuario no editado."
			render 'edit'
		end
	end

	def destroy
		@user =  User.find(params[:id])
		@user.destroy

		respond_to do |format|
			format.js
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin_type, :client_type, :client_id)
	end

	def find_users
		@users_tfc = User.where(admin_type: true)
		@users_client = User.where(client_type: true)
	end

end
