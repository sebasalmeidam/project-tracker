class Admin::AttachmentsController < Admin::ApplicationController

before_action :find_task, except: [:show]

	def show
		attachment = Attachment.find(params[:id])
		send_file attachment.file.path, disposition: :inline
	end

	def new
		@attachment = Attachment.new
	end

	def create
		@attachment = Attachment.new(attachment_params)

		if @attachment.save
			respond_to do |format|
      	format.js { flash.now[:notice] = "El adjunto ha sido agregado correctamente." }
    	end
		else
			respond_to do |format|
      	format.js { flash.now[:notice] = "El adjunto NO ha sido agregado." }
    	end
		end
	end

	def destroy
		@attachment =  Attachment.find(params[:id])
		@attachment.destroy

		respond_to do |format|
			format.js
		end
	end

	private

	def attachment_params
		params.require(:attachment).permit(:file, :file_name, :task_id, :client_id)
	end

	def find_task
		if params[:task_id].present?
			@task = Task.find(params[:task_id])
		end
	end

end