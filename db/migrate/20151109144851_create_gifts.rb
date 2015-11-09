class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.integer :price
      t.references :bar, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
