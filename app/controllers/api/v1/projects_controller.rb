module API
  module V1

    # respond_to :json

    class ProjectsController < ApplicationController

      def index
        # respond_to do |format|
          # format.json do
            projects = Project.all
            render json: projects, status: 200
          # end
        # end
      end

      def create
      end

      def update
      end

      def destroy
      end
    end
  end
end
