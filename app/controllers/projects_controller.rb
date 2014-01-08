class ProjectsController < ApplicationController

  before_filter :get_project, only: [:edit, :show]
  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to edit_project_path(@project)
    else
      respond_with(@project) do |format|
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.html { redirect_to :new }
      end
    end
  end
  
  def edit
  end
  
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end
  
  def show
  end
  
  protected 
  def get_project
    @project = Project.find(params[:id])
  end
  
  private
  def project_params
    params.require(:project).permit(:category, :title, :course, :description, :site_link, :github_link, :download_link, :priority)
  end
   
end