class AttachmentsController < ApplicationController

	skip_before_filter :not_client


	def show
		attachment = Attachment.find(params[:id])
		send_file attachment.file.path, disposition: :inline
	end

	private




end
