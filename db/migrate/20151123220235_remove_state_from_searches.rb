class RemoveStateFromSearches < ActiveRecord::Migration
  def change
    remove_column :searches, :state, :string
  end
end
