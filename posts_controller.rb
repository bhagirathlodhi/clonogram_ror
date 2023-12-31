class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find_by(id: current_user.id)
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to root_path, notice: 'post has been created successfully'
    else
      render :new
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end
  def def update

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, notice: "Post deleted"
  end

  private
  def post_params
    params.require(:post).permit(:title, :description)
  end
end
