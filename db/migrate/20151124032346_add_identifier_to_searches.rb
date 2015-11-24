class AddIdentifierToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :identifier, :string
  end
end
