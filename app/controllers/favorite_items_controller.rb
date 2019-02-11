class FavoriteItemsController < ApplicationController
  def create
    favorite = FavoriteItem.create(item_params)
    if favorite.save
      redirect_to item_path
  end

  def destroy
    favorite = FavoriteItem.find(params[:id])
    if favorite.user_id == current_user.id
      favorite.destroy
      redirect_to item_path
    end


  private
  def favorite_params
    params.require(:favorite_item).permit(:user_id, :item_id)
  end
end
