class RenameIsAcceptedToConfirmedInOffers < ActiveRecord::Migration[7.0]
  def change
    rename_column :offers, :is_accepted, :confirmed
  end
end
