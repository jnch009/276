class AddAttributesToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :rdate, :date
  end
end
