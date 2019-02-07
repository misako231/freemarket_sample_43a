class ItemsController < ApplicationController
  include GetCategories
  before_action :get_root

  def show
  end

  def new
    @item = Item.new
    10.times { @item.item_photos.build }
  end

  def create
    item  = Item.new(item_params)
    if item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :comment, :category_id, :brand_id, :shipping_fee, :prefecture_id, :days_to_ship, :price, :condition, :closed, item_photos_attributes: [:image]).merge(user_id: current_user.id)
  end

end
