class CreditcardsController < ApplicationController

  def create
    begin
      Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
      customer_id = Creditcard.create_token(params)
      @credit = Creditcard.new(user_id: current_user.id, customer_token: customer_id)
      if @credit.save
        redirect_to done_user_profiles_path(user_id: current_user.id)
      else
        redirect_to credit_user_profiles_path, flash: {credit_create_error: 'クレジットカード登録に失敗しました'}
      end
    rescue => e
      redirect_to credit_user_profiles_path, flash: {credit_create_error: 'クレジットカード登録に失敗しました'}
    end
  end

  def add
    begin
      Payjp.api_key = Rails.application.credentials.PAYJP_SECRET_KEY
      customer_id = Creditcard.create_token(params)
      @credit = Creditcard.new(user_id: current_user.id, customer_token: customer_id)
      if @credit.save
        redirect_to user_profiles_path(user_id: current_user.id), flash: {credit_create: 'クレジットカードを登録しました'}
      else
        redirect_to add_credit_user_profiles_path, flash: {credit_create_error: 'クレジットカード登録に失敗しました'}
      end
    rescue => e
      redirect_to add_credit_user_profiles_path, flash: {credit_create_error: 'クレジットカード登録に失敗しました'}
    end
  end
end
