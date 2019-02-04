class ItemsController < ApplicationController
  def show
  end

  def new
    @item = Item.new
    @item.itme_photos.build
  end

  def create
    item  = Item.new(item_params)
    item.save
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :comment, :category_id, :brand_id, :shipping_fee, :prefecture, :days_to_ship, :price, :condition, :closed, items_photos_attributes: [:image]).merge(user_id: current_user.id)
  end

end
