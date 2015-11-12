class AddTokenToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :token, :string

    add_index :bookings, :token, unique: true
  end
end
