class AddIndexToSearches < ActiveRecord::Migration
  def change
    add_index :searches, [:user_id, :created_at]
  end
end
