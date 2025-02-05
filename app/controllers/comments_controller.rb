class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(comment_params.merge(user: current_user))
    if @comment.save
      redirect_to @project, notice: 'Comment added.'
    else
      render :new
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
