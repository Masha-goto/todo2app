class TasksController < ApplicationController
	before_action :set_task, only: [:show, :edit, :update]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def index
		@tasks = Task.all
	end

	def show
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			redirect_to task_path(@task), notice: 'Saved in.'
		else
			flash.now[:error] = 'Failed to save.'
			render :new
		end
	end

	def edit
	end

	def update
		if @task.update(task_params)
			redirect_to task_path(@task), notice: 'I was able to change it.'
		else
			flash.now[:error] = 'Could not change.'
			render :edit
		end
	end

	def destroy
		article = Task.find(params[:id])
		article.destroy!
		redirect_to root_path, notice: 'Successfully deleted.'
	end

	private
	def task_params
		params.require(:task).permit(:title, :content)
	end

	def set_task
    @task = Task.find(params[:id])
  end
end