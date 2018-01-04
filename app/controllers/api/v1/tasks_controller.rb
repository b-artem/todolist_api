class API::V1::TasksController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource through: :project

  def create
    return render json: @task, status: :created if @task.save
    render json: { errors: @task.errors }, status: :unprocessable_entity
  end

  private

    def task_params
      params.require(:task).permit(:name)
    end
end
