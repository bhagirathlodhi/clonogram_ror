class CommentsController < ApplicationController
  def index
    @comments =  Comment.all
  end

  def  new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    if @comment.save
      redirect_to post_path(@post)
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
    params .require(:comment).permit(:message)
  end
end
