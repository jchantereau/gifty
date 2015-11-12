class RenameCodeIntoVoucherForBookings < ActiveRecord::Migration
  def change
    rename_column :bookings, :code, :voucher
  end
end
