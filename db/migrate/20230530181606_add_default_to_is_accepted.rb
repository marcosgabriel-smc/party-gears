class AddDefaultToIsAccepted < ActiveRecord::Migration[7.0]
  def change
    change_column_default :offers, :is_accepted, false
  end
end
