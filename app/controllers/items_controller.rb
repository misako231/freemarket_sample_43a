class ItemsController < ApplicationController
  include GetCategories
  include GetPoints
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :get_root
  before_action :set_item, only: [:show, :own, :buy, :edit]
  before_action :get_category_tree, only: [:show, :own]
  before_action :total_point, only: [:show, :buy]

  def index
    @items         = Item.with_category.item_includes.new_arrival
    @ladies_items  = @items.search_with_root_id(1).first(4)
    @mens_items    = @items.search_with_root_id(2).first(4)
    @baby_items    = @items.search_with_root_id(3).first(4)
    @cosme_items   = @items.search_with_root_id(7).first(4)
    @chanel_items  = @items.where(brand_id: 5).first(4)
    @vuitton_items = @items.where(brand_id: 3).first(4)
    @supreme_items = @items.where(brand_id: 4).first(4)
    @nike_items    = @items.where(brand_id: 2).first(4)
  end


  def show
    @comments = @item.comments.includes(:user)
  end


  def new
    @item = Item.new
    @item.item_photos.build

    if params[:root_id].present?
      @new_children = Category.where(ancestry: params[:root_id])
      render json: @new_children
    elsif params[:child_id].present?
      @new_grand_children = Category.where("ancestry LIKE ?", "%/#{params[:child_id]}")
      render json: @new_grand_children
    elsif params[:grand_child_id].present?
      @new_great_grand_children = Category.where("ancestry LIKE ?", "%/#{params[:grand_child_id]}")
      render json: @new_great_grand_children

    end
  end

  def create
    @item  = Item.new(item_params)
    if @item.save
      render json: @item
    else
      render :new
    end
  end

  def onsale
    @items = Item.item_includes.where(user_id: current_user.id).new_arrival
  end

  def orderd
    @items = Item.item_includes.where(user_id: current_user.id, order_statuses:{ status: [0,1,2] }).order("items.id DESC")
  end

  def show
    @item = Item.find(params[:id])
    @users_item = Item.item_includes.where(user_id: @item.user_id).all
    @previous = @item.next_to_item("previous")
    @next_item = @item.next_to_item("next_item")
    @comments = @item.comments.includes(:user)
  end

  def own
    @comments = @item.comments.includes(:user)
  end

  def edit
    category = Category.find(@item.category_id)
    @categories = category.ancestry.split('/')
    if @categories.length == 3
      @parent_category, @child_category, @grandchild_category = Category.find(@categories)
      @category = Category.find(@item.category_id)
    else
      @parent_category, @child_category = Category.find(@categories)
      @grandchild_category = Category.find(@item.category_id)
    end

  end

  def update
    item = Item.find(params[:id])
    if item.update(update_item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      item.destroy
      redirect_to onsale_user_items_path, flash: {success: '商品を削除しました'}
    end
  end

  def buy
    @item.order_statuses.build
  end

  def charge
    begin
      Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
      price = params[:item][:price]
      @creditcard = Creditcard.includes(:user).where(user_id: current_user.id)
      user = Payjp::Customer.retrieve(@creditcard[0].customer_token)
      Item.create_charge_by_customer(price, user)
      item = Item.includes(:user).find(params[:id])
      o_status = OrderStatus.create(status: params[:item][:order_statuses_attributes][:"0"][:status], purchaser_id: params[:item][:order_statuses_attributes][:"0"][:purchaser_id], seller_id: params[:item][:order_statuses_attributes][:"0"][:seller_id], item_id: params[:item][:order_statuses_attributes][:"0"][:item_id])
      if current_user.point_records.present? && params[:item][:point_records][:point].present?
        p_record = PointRecord.create(point: params[:item][:point_records][:point], user_id: current_user.id, order_status_id: o_status.id)
      end
      redirect_to root_path, flash: {bought: '商品を購入しました'}
    rescue => e
      redirect_to buy_item_path, flash: {credit_charge_error: '購入に失敗しました'}
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :comment, :category_id, :brand_id, :shipping_fee, :prefecture_id, :days_to_ship, :price, :condition, :closed, :transportation, item_photos_attributes: [:image]).merge(user_id: current_user.id)
  end

  def update_item_params
    params.require(:item).permit(:name, :comment, :category_id, :brand_id, :shipping_fee, :prefecture_id, :days_to_ship, :price, :condition, :closed, :transportation, item_photos_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.includes([:user, :item_photos, :category, :favorite_items, :order_statuses]).find(params[:id])
  end

  def get_category_tree
    category = Category.find(@item.category_id)
    categories = category.ancestry.split('/')
    if categories.length == 3
      @parent_category, @child_category, @grandchild_category = Category.find(categories)
    else
      @parent_category, @child_category = Category.find(categories)
      @grandchild_category = Category.find(@item.category_id)
    end
  end

end
