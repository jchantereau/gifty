class ChangeDefaultCompleteForBookings < ActiveRecord::Migration
  def up
    change_column_default :bookings, :complete, false
  end

  def down
    change_column_default :bookings, :complete, nil
  end
end
