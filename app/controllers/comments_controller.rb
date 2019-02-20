class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to "/items/#{@comment.item.id}" }
      format.js
    end
  end

  def destroy
    item = Item.find(params[:item_id])
    comment = Comment.find(params[:id])
    if item.user_id
      comment.destroy
      redirect_to "/items/#{item.id}", flash: {success: 'コメントを削除しました'}
    end
  end

  private
  def comment_params
    params.permit(:content).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
