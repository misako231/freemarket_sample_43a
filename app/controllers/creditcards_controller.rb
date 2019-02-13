class CreditcardsController < ApplicationController

  def create
    begin
      Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
      customer = Creditcard.create_token(params, customer)
      @credit = Creditcard.new(user_id: current_user.id, customer_token: customer.id)
      if @credit.save
        redirect_to done_user_profiles_path(user_id: current_user.id)
      else
        redirect_to credit_user_profiles_path, flash: {credit_create_error: 'クレジットカード登録に失敗しました'}
      end
    rescue => e
      redirect_to credit_user_profiles_path, flash: {credit_create_error: 'クレジットカード登録に失敗しました'}
    end
  end
end
