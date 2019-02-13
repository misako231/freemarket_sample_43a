class Creditcard < ApplicationRecord
belongs_to :user

  def self.months
   months = []
   for month in 1..12 do
     months << month
   end
   return months
  end

  def self.years
   years = []
   for year in 2019..2030 do
     years << year
   end
   return years
  end

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
