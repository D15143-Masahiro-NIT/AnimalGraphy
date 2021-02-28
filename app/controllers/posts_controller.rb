class PostsController < ApplicationController
  before_action :authenticate_user!, { only: [ :new, :create, :edit, :update, :destroy ] }
  before_action :set_target_post, { only: [ :show, :edit, :update, :destroy ] }
  before_action :check_permission, { only: [ :edit, :update, :destroy ] }

  def index
    @posts = Post.all.order(created_at: :desc).includes(:user).page(params[:page])
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to(posts_path)
    else
      render(:new)
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to(posts_path)
    else
      render(:edit)
    end
  end

  def destroy
    @post.destroy
  end

  private

  def set_target_post
    @post = Post.find(params[:id])
  end

  def check_permission
    redirect_to(posts_path) unless @post.user_id == current_user.id
  end

  def post_params
    params.require(:post).permit(:comment, :image).merge(user_id: current_user.id)
  end
end
