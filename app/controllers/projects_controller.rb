class ProjectsController < ApplicationController

  before_filter :get_project, only: [:destroy, :edit, :show, :update]
  before_filter :require_user, only: [:create, :destroy, :edit, :index, :new, :update]

  respond_to :html, :json

  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to project_path(@project)
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
    redirect_to projects_path
  end
  
  def edit
  end
  
  def index
    @projects = Project.all
    params[:source] = "ADMIN"
  end

  def markdown
    html_content = PersonalSite::MARKDOWN.render(params[:markdown_content])
    render json: {html_content: html_content}
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

  def courses
    @title = "Course Projects"
    @projects = Project.where(category: "COURSE")
    params[:source] = "COURSE"
  end

  def hackathons
    @title = "Hackathons"
    @projects = Project.where(category: "HACKATHON")
    params[:source] = "HACKATHON"
  end

  def portfolio
    @title = "Portfolio"
    @projects = Project.where(category: "PERSONAL")
    params[:source] = "PERSONAL"
  end
  
  protected 
  def get_project
    @project = Project.find(params[:id])
  end
  
  private
  def project_params
    params.require(:project).permit(:category, :title, :handle, :num_images, :modifier, :content, :description, :site_link, :github_link, :download_link, :priority)
  end

end