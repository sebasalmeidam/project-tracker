class Admin::ApplicationController < ApplicationController

	before_action :not_authorized
	skip_before_filter :not_client


  private

  def not_authorized
  	if logged_in? && current_user.client_type 
	  		flash[:notice] = "Sin permiso para ver el contenido solicitado."
	  		redirect_to client_path(current_user.client_id)
	  end

  end

end