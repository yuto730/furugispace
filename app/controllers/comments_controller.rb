class CommentsController < ApplicationController
  def create
    if comment = Comment.create(comment_params)
      redirect_to "/coordinations/#{comment.coordination.id}"
    else
      render :show
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, coordination_id: params[:coordination_id])
  end
end
