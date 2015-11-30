class RemoveOffsetFromSearches < ActiveRecord::Migration
  def change
    remove_column :searches, :offset, :string
    remove_column :searches, :slimit, :integer
  end
end
