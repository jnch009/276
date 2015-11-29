class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :restname
      t.integer :slimit
      t.string :location
      t.integer :offset
      t.integer :sort
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index :searches, [:user_id, :created_at]
  end
end
