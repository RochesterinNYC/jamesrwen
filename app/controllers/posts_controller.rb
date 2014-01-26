class PostsController < ApplicationController

  before_filter :get_post, only: [:destroy, :edit, :show, :update]
  before_filter :require_user, only: [:create, :destroy, :edit, :new, :update]

  respond_to :html, :json

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      respond_with(@post) do |format|
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def edit
  end

  def index
    @posts = Post.order('created_at').all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def update
    if @post.update_attributes(post_params)
      render :show
    else
      render :edit
    end
  end

  protected
  def get_post
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :content, :handle)
  end

end
