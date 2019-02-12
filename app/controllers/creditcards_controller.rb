class CreditcardsController < ApplicationController

  def pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Creditcard.create_token(params, customer)
    # binding.pry
    @credit = Creditcard.new(user_id: current_user.id, customer_token: customer.id)
    if @credit.save
      redirect_to done_user_profiles_path(user_id: current_user.id)
    end
  end
end
