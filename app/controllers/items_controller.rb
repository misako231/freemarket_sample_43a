class ItemsController < ApplicationController
  def show
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_pramas)
  end

  private
  def item_pramas
    pramas.require(:item).permit(:name, :comment, :category_id, :brand_id, :shipping_fee, :prefecture, :days_to_ship, :price, :condition, :closed).merge(user_id: current_user.id)
  end

end
