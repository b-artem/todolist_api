require 'task_update'

class API::V1::TasksController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource through: :project

  def index
    render json: @tasks, status: :ok
  end

  def create
    return render json: @task, status: :created if @task.save
    render json: { errors: @task.errors }, status: :unprocessable_entity
  end

  def update
    task_update = Services::TaskUpdate.new(task: @task, task_params: task_params,
      change_priority: params[:change_priority])
    return render json: @task, status: :ok if task_update.call
    render json: { errors: @task.errors }, status: :unprocessable_entity
  end

  def destroy
    return head :no_content if @task.destroy
    render json: { errors: I18n.t('.fail') }
  end

  private

    def task_params
      params.require(:task).permit(:name, :done, :deadline)
    end
end
