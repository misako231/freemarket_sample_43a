class ItemsController < ApplicationController
  include GetCategories
  before_action :get_root
  before_action :set_item, only: [:show]

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

  def buy
    @item  = Item.find(params[:id])
  end

  def pay
    # binding.pry
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
    :amount => 3500,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
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
    @previous = @item.next_to_item("previous")
    @next_item = @item.next_to_item("next_item")
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

  def set_item
    @item = Item.includes([:user, :item_photos, :category]).find(params[:id])
  end

  def set_ancestors(category)
    Category.ancestors_of(category)
  end


end
