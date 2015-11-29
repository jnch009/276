class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.string :restaurants
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
      add_index :reviews, [:user_id, :created_at]
    end
  end
end
