class CreateGears < ActiveRecord::Migration[7.0]
  def change
    create_table :gears do |t|
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.string :name
      t.text :description
      t.string :image_url
      t.decimal :price

      t.timestamps
    end
  end
end
