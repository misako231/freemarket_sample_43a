class ProfilesController < ApplicationController
  include GetCategories
  before_action :get_root

  def index
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
  end

  def indentification
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

end
