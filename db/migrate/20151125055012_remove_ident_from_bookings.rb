class RemoveIdentFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :Ident, :string
  end
end
