class RenameRestaurantInBookings < ActiveRecord::Migration
  def change
    rename_column :bookings, :Restaurant_Date, :restaurant_date
  end
end
