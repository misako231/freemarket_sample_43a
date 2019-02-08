class ItemsController < ApplicationController
  include GetCategories
  before_action :get_root
  before_action :set_item, only: [:show]

  def new
    @item = Item.new
    @item.item_photos.build
  end

  def create
    item  = Item.new(item_params)
    if item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @grandchild_category = Category.find(@item.category_id)
    @child_category = set_ancestors(@grandchild_category).last
    @parent_category = set_ancestors(@grandchild_category).first
    @users_item = Item.where(user_id: @item.user_id).all
    next_to_item(@item)
  end


  private

  def item_params
    params.require(:item).permit(:name, :comment, :category_id, :brand_id, :shipping_fee, :prefecture_id, :days_to_ship, :price, :condition, :closed, item_photos_attributes: [:image]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.includes([:user, :item_photos, :category]).find(params[:id])
  end

  def set_ancestors(category)
    Category.ancestors_of(category)
  end


  def next_to_item(item)
    @previous = Item.where('id < ?', item.id).order('id DESC').first
    @next_item = Item.where('id > ?', item.id).order('id ASC').first
  end
end
