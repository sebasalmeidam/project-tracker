class SessionsController < ApplicationController
  
	skip_before_filter :not_client
	skip_before_filter :not_logged_in

  def new
  	if logged_in?
  		if current_user.admin_type
  			redirect_to admin_user_path(current_user.id)
  		else
  			#not putting explicit elsif client_type true
  			redirect_to client_path(current_user.client_id)
  		end
  	else
  		render 'new'
  	end
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    	if user.admin_type
    		log_in user
        remember user
    		params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      	redirect_to admin_user_path(user)
    	elsif user.client_type
    		log_in user
    		redirect_to client_path(current_user.client_id)
    	end      
    else
      flash.now[:notice] = "Combinacón invalida de email/contraseña."
      render 'new'
    end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_path
  end
end
