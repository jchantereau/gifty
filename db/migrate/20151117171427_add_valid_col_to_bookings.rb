class AddValidColToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :still_valid, :boolean, default: true
  end
end
