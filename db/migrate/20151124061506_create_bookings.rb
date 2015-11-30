class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :Time
      t.string :restaurant
      t.string :address
      t.date :restaurant_date
      t.string :restid
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
      add_index :bookings, [:user_id, :created_at]
    end
  end
end
