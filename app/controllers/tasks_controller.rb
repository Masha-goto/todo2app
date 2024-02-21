class TasksController < ApplicationController
	def index
		@tasks = Task.all
		@task = Task.new
	end

	def show
		@task = Task.find(params[:id])
	end

	def new
	end

	def create
	end
end