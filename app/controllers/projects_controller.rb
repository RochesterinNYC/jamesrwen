class ProjectsController < ApplicationController

  before_filter :get_project, only: [:delete_attachment, :destroy, :edit, :show, :update]
  before_filter :require_user, only: [:create, :delete_attachment, :destroy, :edit, :index, :markdown, :new, :update]

  respond_to :html, :json

  def create
    @project = Project.create(project_params)
    if @project.save
      params[:source] = "ADMIN"
      redirect_to project_path(@project)
    else
      respond_with(@project) do |format|
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end

  def delete_attachment
    @project.delete_attachment(params[:attachment])
    redirect_to edit_project_path(@project)
  end

  def destroy
    @project.destroy
    #flash[:success] = "Project was deleted."
    redirect_to projects_path
  end

  def edit
  end

  def index
    @projects = Project.order('priority').all
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
      params[:source] = "ADMIN"
      render :show
    else
      flash[:notice] = "Project not updated"
      render :edit
    end
  end

  def courses
    @title = "COURSE PROJECTS"
    @projects = Project.order('priority').course
    params[:source] = "COURSE"
  end

  def hackathons
    @title = "HACKATHON PROJECTS"
    @projects = Project.order('priority').hackathon
    params[:source] = "HACKATHON"
  end

  def portfolio
    @title = "PORTFOLIO PROJECTS"
    @projects = Project.order('priority').personal
    params[:source] = "PERSONAL"
  end

  protected
  def get_project
    @project = Project.friendly.find(params[:id])
  end

  private
  def project_params
    params.require(:project).permit(:category, :title, :handle, :modifier, :content, :description, :site_link, :github_link, :priority, :image1, :image1_file_name, :image2, :image2_file_name, :image3, :image3_file_name, :image4, :image4_file_name, :image5, :image5_file_name, :image6, :image6_file_name, :source_download)
  end

end
