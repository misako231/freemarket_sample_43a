class FavoriteItemsController < ApplicationController
  def create
    FavoriteItem.create(favorite_params)
    @favorite_count = FavoriteItem.where(item_id: params[:item_id]).length
    respond_to do |format|
      format.html { redirect_to item_path(params[:item_id])}
      format.js
    end
  end

  def destroy
    favorite = FavoriteItem.find_by(user_id: params[:user_id])
    if favorite.user_id == current_user.id
      favorite.destroy
      @favorite_count = FavoriteItem.where(item_id: params[:item_id]).length
      respond_to do |format|
        format.html { redirect_to item_path(params[:item_id])}
        format.js
      end
    end
  end


  private
  def favorite_params
    params.permit(:user_id, :item_id)
  end
end
