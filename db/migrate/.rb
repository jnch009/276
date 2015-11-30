class AddColumns < ActiveRecord::Migration
  def change
    add_column :searches,:location,:string
  end
end
