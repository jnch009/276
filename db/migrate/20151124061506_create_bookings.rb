class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :FirstName
      t.string :LastName
      t.string :Phone
      t.string :Time

      t.timestamps null: false
    end
  end
end
