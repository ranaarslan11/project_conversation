class StatusChangesController < ApplicationController
  before_action :authenticate_user!
  def create
    @project = Project.find(params[:project_id])
    @status_change = @project.status_changes.build(status_change_params.merge(user: current_user))
    @status_change.previous_status = @project.status
    if @status_change.save
      @project.update(status: @status_change.new_status)
      redirect_to @project, notice: 'Status updated.'
    else
      render :new
    end
  end
  private
  def status_change_params
    params.require(:status_change).permit(:new_status)
  end
end