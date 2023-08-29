class CommentsController < ApplicationController
  def index
    @comments =  Comment.all
  end

  def  new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(param[:id])
    if @comment.save
      @post = @comment.post
      flash[:notice] = "Successfully created"
    else
      flash[:notice] = "something went wrong"
    end
  end
  def show

  end

  def edit

  end
  def def destroy

  end
  private
  def comment_params
    param.require(:comment).permit(:comments)
  end
end
