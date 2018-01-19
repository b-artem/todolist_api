require 'api/v1/task_update'

class API::V1::TasksController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource through: :project

  def index
    render json: @tasks, status: :ok
  end

  def create
    return render json: @task, status: :created if @task.save
    render json: @task.errors.full_messages, status: :unprocessable_entity
  end

  def update
    task_update = API::V1::TaskUpdateService.new(task: @task,
      task_params: task_params, change_priority: params[:change_priority])
    return render json: @task, status: :ok if task_update.call
    render json: @task.errors.full_messages, status: :unprocessable_entity
  end

  def destroy
    head :no_content if @task.destroy
  end

  private

    def task_params
      params.require(:task).permit(:name, :done, :deadline)
    end
end
