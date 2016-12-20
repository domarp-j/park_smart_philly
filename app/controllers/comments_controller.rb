class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(strong_comment_params)
    @comment.post_time = DateTime.now

    if @comment.save
      flash[:success] = "Comment added."
      redirect_back fallback_location: root_path
    else
      flash[:error] = "Could not add comment."
      redirect_back fallback_location: root_path
    end
  end

  private

    def strong_comment_params
      params.require(:comment).permit(
        :body,
        :commentable_id,
        :commentable_type
      )
    end

end
