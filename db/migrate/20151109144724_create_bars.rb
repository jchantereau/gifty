class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.string :address
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
