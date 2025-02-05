class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to @project, notice: 'Project created successfully.'
    else
      render :new
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :status)
  end
end
