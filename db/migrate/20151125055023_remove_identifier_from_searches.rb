class RemoveIdentifierFromSearches < ActiveRecord::Migration
  def change
    remove_column :searches, :identifier, :string
  end
end
