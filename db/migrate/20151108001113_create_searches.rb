class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :restname
      t.integer :slimit
      t.string :location
      t.integer :offset
      t.integer :sort
      t.timestamps null: false
    end
  end
end
