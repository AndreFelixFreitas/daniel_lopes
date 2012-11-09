class CommentsController < ApplicationController
  # POST /comments
  # POST /comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = Post.comments.build(params[:comment])
    flash[:alert] = 'Fail to receive the comment. Double check de fields.' unless
      @comment.save

    redirect_to @post
  end
end
