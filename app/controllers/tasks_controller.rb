class TasksController < ApplicationController
  before_action :set_task, only: [:destroy, :update]
  def index
    @incomplete_tasks = Task.where(complete: false)
    @complete_tasks = Task.where(complete: true)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end

  def update
    @task.update(task_params)
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:complete, :name)
    end
end
