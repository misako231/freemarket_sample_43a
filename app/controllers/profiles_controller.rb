class ProfilesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to done_user_profiles_path
    else
      render :index
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

  def logout
  end

  def done
  end

  private
  def profile_params
    params.permit(:phone, :postal_code, :prefecture, :city, :block, :building).merge(user_id: params[:user_id])
  end

end
