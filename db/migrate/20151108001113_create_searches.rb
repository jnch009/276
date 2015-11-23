class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :restname
      t.string :address
      t.string :state
      t.string :city
      t.integer :slimit
      t.timestamps null: false
    end
  end
end
