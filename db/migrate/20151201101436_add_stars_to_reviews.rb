class AddStarsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :stars, :string
  end
end
