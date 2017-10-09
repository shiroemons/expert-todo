class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def edit
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy!
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private

    def set_task
      @task = current_user.tasks.find_by(id: params[:id])
      unless @task
        redirect_to tasks_url
      end
    end

    def task_params
      params.require(:task).permit(:title, :content, :expired_at)
    end
end
