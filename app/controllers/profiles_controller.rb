class ProfilesController < ApplicationController
  include GetCategories
  before_action :get_root

  def index
    @items = Item.includes([:item_photos, :favorite_items, :order_statuses]).where(order_statuses:{ status: [0,1,2], purchaser_id: current_user.id }).order("items.id DESC")
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to credit_user_profiles_path
    else
      render :new
    end
  end

  def show
  end

  def update
    @profile = current_user.profile
    profile = Profile.find(params[:id])
    if profile.update(update_profile_params)
      redirect_to identification_user_profile_path, flash: {profile_update: '更新しました'}
    else
      render :identification
    end
  end

  def user_edit
    current_user.nickname = user_edit_params[:nickname]
    current_user.comment = user_edit_params[:comment]
    current_user.avatar = user_edit_params[:avatar]
    if current_user.save(context: :edit_user)
      redirect_to user_profile_path(id: current_user.profile.id), flash: {profile_update: '更新しました'}
    else
      render :show
    end
  end

  def identification
    @profile = current_user.profile
  end

  def card
  end

  def credit
  end

  def logout
  end

  def done
  end

  private
  def profile_params
    params.permit(:phone, :postal_code, :prefecture_id, :city, :block, :building).merge(user_id: params[:user_id])
  end

  def update_profile_params
    params.permit(:postal_code, :prefecture_id, :city, :block, :building)
  end

  def user_edit_params
    params.require(:user).permit(:nickname, :comment, :avatar)
  end

end
