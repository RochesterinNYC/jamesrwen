class ProjectsController < ApplicationController

  before_filter :get_project, only: [:destroy, :edit, :show, :update]
  before_filter :require_user, only: [:create, :destroy, :edit, :new, :show, :update]

  respond_to :html, :json

  def create
    @project = Project.create(project_params)
    if @project.save
      render :show
    else
      respond_with(@project) do |format|
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end

  def destroy
    @project.destroy
    #flash[:success] = "Project was deleted."
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

  def update
    if @project.update_attributes(project_params)
      render :show
    else
      flash[:notice] = "Project not updated"
      render :edit
    end
  end

  def classes
    @title = "Class Projects"
    @projects = Project.where(category: "CLASS")
  end

  def hackathons
    @title = "Hackathons"
    @projects = Project.where(category: "HACKATHON")
  end

  def portfolio
    @title = "Portfolio"
    @projects = Project.where(category: "PERSONAL")
  end
  
  protected 
  def get_project
    @project = Project.find(params[:id])
  end
  
  private
  def project_params
    params.require(:project).permit(:category, :title, :handle, :num_images, :course, :description, :site_link, :github_link, :download_link, :priority)
  end

end