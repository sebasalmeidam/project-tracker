class ClientsController < ApplicationController

	def show
		@client = Client.find(params[:id])
		@tasks = @client.tasks
	end

end
