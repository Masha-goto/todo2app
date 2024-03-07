class TasksController < ApplicationController
	before_action :set_task, only: [:show]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def index
		@tasks = Task.all
	end

	def show
	end

	def new
		@task = current_user.tasks.build
	end

	def create
		@task = current_user.tasks.build(task_params)
		if @task.save
			redirect_to task_path(@task), notice: 'Saved in.'
		else
			flash.now[:error] = 'Failed to save.'
			render :new
		end
	end

	def edit
		@task = current_user.tasks.find(params[:id])
	end

	def update
		@task = current_user.tasks.find(params[:id])
		if @task.update(task_params)
			redirect_to task_path(@task), notice: 'I was able to change it.'
		else
			flash.now[:error] = 'Could not change.'
			render :edit
		end
	end

	def destroy
		task = current_user.tasks.find(params[:id])
		task.destroy!
		redirect_to root_path, notice: 'Successfully deleted.'
	end

	private
	def task_params
		params.require(:task).permit(:name, :content)
	end

	def set_task
		@task = Task.find(params[:id])
	end
end