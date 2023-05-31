class AddTotalPriceToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :total_price, :decimal
  end
end
