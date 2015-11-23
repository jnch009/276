class AddSlimitToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :slimit, :integer
  end
end
