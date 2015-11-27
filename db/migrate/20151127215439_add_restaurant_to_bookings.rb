class AddRestaurantToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :restaurant, :string
    add_column :bookings, :address, :string
  end
end
