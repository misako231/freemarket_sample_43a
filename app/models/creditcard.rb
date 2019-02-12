class Creditcard < ApplicationRecord
belongs_to :user

  def self.create_token(params, customer)
    token = Payjp::Token.create({
    :card => {
      :number => params[:number],
      :cvc => params[:cvc],
      :exp_month => params[:exp_month],
      :exp_year => params[:exp_year]
      }},
      {
      'X-Payjp-Direct-Token-Generate': 'true'
      }
    )
     customer = Payjp::Customer.create(
                         card: token.id
                         )
  end
end
