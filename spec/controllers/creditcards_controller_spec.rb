require 'rails_helper'

describe CreditcardsController, type: :controller do
  describe 'POST #create' do

    it 'Creditcard.new acureate request' do
      # Creditcardモデルのcreate_tokenメソッドが呼ばれたら'cus_12345'と返す
      allow(Creditcard).to receive(:create_token).and_return('cus_12345')
      params = []
      @user = create(:user)
      customer_id = Creditcard.create_token(params)
      @credit = Creditcard.new(customer_token: customer_id , user_id: @user.id)
    end

    it 'rescue acureate request'do
    # Creditcardモデルのcreate_tokenメソッドが呼ばれたらエラーを発生させる
    allow(Creditcard).to receive(:create_token).and_raise('エラーが発生しました')
    @user = create(:user)
    params = []
      begin
        customer_id = Creditcard.create_token(params)
        @credit = Creditcard.new(customer_token: customer_id , user_id: @user.id)
      rescue => e
        redirect_to credit_user_profiles_path(user_id: @user.id)
      end
    end
  end
end
