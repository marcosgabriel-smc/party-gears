class AddAcceptedToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :accepted, :boolean, default: false
  end
end
