class RemoveCityFromSearches < ActiveRecord::Migration
  def change
    remove_column :searches, :city, :string
  end
end
