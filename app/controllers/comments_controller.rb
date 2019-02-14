class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    redirect_to "/items/#{@comment.item.id}"
  end

  private
  def comment_params
    params.permit(:content).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
