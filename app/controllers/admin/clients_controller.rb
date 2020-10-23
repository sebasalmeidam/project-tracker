class Admin::ClientsController < Admin::ApplicationController

	def index
		@clients = Client.all
		@pending_tasks = Task.where.not(pending: [nil, ""]).where(done: false)
	end

	def show
		@client = Client.find(params[:id])
		@tasks = @client.tasks
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)

		if @client.save
			flash[:notice] = "El Cliente ha sido creado."
			redirect_to admin_clients_path
		else
			flash.now[:alert] = "El cliente no ha sido creado."
			render "new"
		end
	end

	def edit
		@client = Client.find(params[:id])
	end

	def update
		@client = Client.find(params[:id])
		if @client.update_attributes(client_params)
    	flash[:notice] = "Cliente actualizado correctamente"
      redirect_to admin_clients_path
    else
    	flash.now[:alert] = "El Cliente no ha sido actualizado."
      render 'edit'
    end
	end

	def destroy
		client = Client.find(params[:id])
		client.destroy
		flash[:notice] = "El cliente: #{client.name} ha sido eliminado."
    redirect_to admin_clients_path

	end

	private

	def client_params
		params.require(:client).permit(:name)
	end


end
