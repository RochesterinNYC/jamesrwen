class UploadsController < ApplicationController

  before_filter :get_upload, only: [:delete_file, :destroy, :edit, :show, :update]
  before_filter :require_user, only: [:create, :delete_file, :destroy, :edit, :index, :new, :show, :update]

  respond_to :html, :json

  def create
    @upload = Upload.create(upload_params)
    if @upload.save
      redirect_to upload_path(@upload)
    else
      respond_with(@upload) do |format|
        format.json { render json: @upload.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end

  def delete_file
    @upload.delete_attachment('file')
    redirect_to edit_upload_path(@upload)
  end


  def destroy
    @upload.destroy
    redirect_to uploads_path
  end

  def edit
  end

  def index
    @uploads = Upload.order('created_at').all
  end

  def new
    @upload = Upload.new
  end

  def show
  end

  def update
    if @upload.update_attributes(upload_params)
      render :show
    else
      render :edit
    end
  end

  protected
  def get_upload
    @upload = Upload.find(params[:id])
  end

  private
  def upload_params
    params.require(:upload).permit(:description, :handle, :file, :file_file_name)
  end

end
