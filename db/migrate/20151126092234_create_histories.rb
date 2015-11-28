class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :FirstName
      t.string :LastName
      t.string :Phone
      t.string :Time
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index :histories, [:user_id, :created_at]
  end
end
