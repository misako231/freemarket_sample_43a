class ProfilesController < ApplicationController
  def index
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to done_user_profiles_path
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

  def logout
  end

  def done
  end

  # def credit
  #   Payjp.api_key = 'sk_test_1f82925154c7233eefd69aca'
  #   Payjp::Charge.create(
  #     amount: 3500, # 決済する値段
  #     card: params['payjp-token'],
  #     currency: 'jpy'
  #   )
  # end

  private
  def profile_params
    params.permit(:phone, :postal_code, :prefecture, :city, :block, :building).merge(user_id: params[:user_id])
  end

end
