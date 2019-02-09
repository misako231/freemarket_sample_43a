class ItemsController < ApplicationController
  include GetCategories
  before_action :get_root

  def index
    @items = Item.with_category.includes(:item_photos).new_arrival
    @ladies_items = @items.search_with_root_id(1).first(4)
    @mens_items = @items.search_with_root_id(2).first(4)
    @baby_items = @items.search_with_root_id(3).first(4)
    @cosme_items = @items.search_with_root_id(7).first(4)
  end

  def show
  end

  def buy
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

  def onsale
    @items = Item.where(user_id: current_user.id)
  end

  def own
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :comment, :category_id, :brand_id, :shipping_fee, :prefecture_id, :days_to_ship, :price, :condition, :closed, item_photos_attributes: [:image]).merge(user_id: current_user.id)
  end

end
