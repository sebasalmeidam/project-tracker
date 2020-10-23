class Admin::TasksController < Admin::ApplicationController

before_action :find_client

	def index
		@tasks = @client.tasks
	end

	def show
		@task = Task.find(params[:id])
		@attachment = Attachment.new
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)

		if @task.save
			flash[:notice] = "El registro ha sido creado exitosamente."
			redirect_to admin_client_task_path(@client, @task)
		else
			flash.now[:notice] = "El registro no fue creado."
			render 'new'
		end

	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		if @task.update_attributes(task_params)
    	flash[:notice] = "Registro actualizado correctamente"
      redirect_to admin_client_task_path(@client, @task)
    else
    	flash.now[:alert] = "El registro no ha sido actualizado."
      render 'edit'
    end
	end

	def destroy
		task = Task.find(params[:id])
		task.destroy
		flash[:notice] = "El registro ha sido eliminado."
    redirect_to admin_client_path(@client)
	end

	def task_complete
		@tasks = @client.tasks
		@task = Task.find(params[:id])
		@pending_tasks = Task.where.not(pending: [nil, ""]).where(done: false)
		
		if @task.update_attributes(done: true)
			respond_to do |format|
      	format.js 
    	end
		else
			respond_to do |format|
      	format.js 
    	end
		end

	end

	def task_incomplete
		@tasks = @client.tasks
		@task = Task.find(params[:id])
		
		if @task.update_attributes(done: false)
			respond_to do |format|
      	format.js 
    	end
		else
			respond_to do |format|
      	format.js 
    	end
		end

	end



	private

	def task_params
		params.require(:task).permit(:project, :description, :task_date, :result, :client_id, :pending, :client_p, :firm_p, :hours, :pending_date, :incharge, :done)
	end

	def find_client
		if params[:client_id].present?
			@client = Client.find(params[:client_id])
		end
	end

end
