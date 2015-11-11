class RemoveFriends < ActiveRecord::Migration
  def up
    remove_reference :bookings, :friend
    drop_table :friends

    add_column :bookings, :friend_name, :string
    add_column :bookings, :friend_email, :string
    add_column :bookings, :friend_phone_number, :string
  end

  def down
    remove_column :bookings, :friend_name, :string
    remove_column :bookings, :friend_email, :string
    remove_column :bookings, :friend_phone_number, :string

    create_table :friends do |t|
      t.string   :name
      t.string   :email
      t.string   :phone_number
      t.timestamps null: false
    end

    add_reference :bookings, :friend, index: true, foreign_key: true
  end
end
