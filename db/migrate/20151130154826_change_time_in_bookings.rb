class ChangeTimeInBookings < ActiveRecord::Migration
  def up
    change_column :bookings, :time, :datetime
  end

  def down
    change_column :bookings, :time, :time
  end
end
