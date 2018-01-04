class API::V1::ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: @projects, status: 200
  end

  def show
    render json: @project, status: 200
  end

  def create
    @project.user = current_user
    return render json: @project, status: :created if @project.save
    render json: { errors: @project.errors }, status: :unprocessable_entity
  end

  def update
    return render json: @project, status: :ok if @project.update_attributes(project_params)
    render json: { errors: @project.errors }, status: :unprocessable_entity
  end

  def destroy
    head :no_content if @project.destroy
    # render json: { errors: I18n.t('.fail') }
  end

  private

    def project_params
      params.require(:project).permit(:name)
    end
end
