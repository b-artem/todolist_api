class API::V1::CommentsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :task, through: :project
  load_and_authorize_resource through: :task

  def index
    render json: @comments, status: :ok
  end

  def create
    return render json: @comment, status: :created if @comment.save
    render json: { errors: @comment.errors }, status: :unprocessable_entity
  end

  def destroy
    return head :no_content if @comment.destroy
    render json: { errors: I18n.t('.fail') }
  end

  private

    def comment_params
      params.require(:comment).permit(:text, :attachment)
    end
end
