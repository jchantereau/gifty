class CreateBarCategories < ActiveRecord::Migration
  def change
    create_table :bar_categories do |t|
      t.references :bar, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
