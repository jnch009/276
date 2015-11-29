class AddIndexToBookings < ActiveRecord::Migration
  def change
    add_index :bookings, [:user_id, :created_at]
  end
end
