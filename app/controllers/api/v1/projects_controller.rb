class API::V1::ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: @projects, status: :ok
  end

  def create
    @project.user = current_user
    return render json: @project, status: :created if @project.save
    render json: @project.errors.full_messages, status: :unprocessable_entity
  end

  def update
    return render json: @project, status: :ok if @project.update(project_params)
    render json: @project.errors.full_messages, status: :unprocessable_entity
  end

  def destroy
    head :no_content if @project.destroy
  end

  private

    def project_params
      params.require(:project).permit(:name)
    end
end
