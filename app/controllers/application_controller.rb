class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :not_client
  before_action :not_logged_in



  private

  def not_client
  	@client = Client.find(params[:id])
  	if !@client.nil?
  		
  		if logged_in? && current_user.client_type 
		  	if current_user.client_id != @client.id
		  		flash[:notice] = "Sin permiso para ver el contenido solicitado."
		  		redirect_to client_path(current_user.client_id)
		  	end
  		end
  	end
  end

  def not_logged_in
  	if !logged_in?
  		flash[:notice] = "Debe iniciar sesión para ver el contenido"
  		redirect_to root_path
  	end
  end




end
