class TasksController < ApplicationController

	def show
		@task = Task.find(params[:id])
	end

end
