class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.references :bar, index: true, foreign_key: true
      t.string :iban

      t.timestamps null: false
    end
  end
end
