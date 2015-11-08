class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer :price
      t.string :restname
      t.string :address
      t.string :state
      t.string :city
      t.string :zip
      t.string :country

      t.timestamps null: false
    end
  end
end
