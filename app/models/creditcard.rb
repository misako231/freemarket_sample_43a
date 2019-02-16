class Creditcard < ApplicationRecord
belongs_to :user

  def self.years
    years = []
    d = Date.today
   for year in d.year..d.year+11 do
     years << year
   end
  end

  def self.create_token(params)
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
     Payjp::Customer.create(card: token.id).id
  end
end
