class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :ends_on
      t.string :message
      t.string :code
      t.boolean :complete
      t.references :gift, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :friend, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
