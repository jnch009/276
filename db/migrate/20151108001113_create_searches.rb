class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :restname
      t.integer :slimit
      t.string :location
      t.string :identifier
      t.timestamps null: false
    end
  end
end
