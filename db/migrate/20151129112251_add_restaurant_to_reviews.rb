class AddRestaurantToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :restaurants, :string
  end
end
