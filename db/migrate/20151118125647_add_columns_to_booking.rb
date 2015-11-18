class AddColumnsToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :state, :string
    add_column :bookings, :gift_sku, :string
    add_monetize :bookings, :amount, currency: { present: false }
    add_column :bookings, :payment, :json
  end
end
