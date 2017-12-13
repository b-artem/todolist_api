class API::V1::ProjectsController < ApplicationController
  def index
    projects = Project.all
    render json: projects, status: 200
  end

  def create
  end

  def update
  end

  def destroy
  end
end
