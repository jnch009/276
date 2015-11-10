class ModifyColumns < ActiveRecord::Migration
  def change
    remove_column :searches,:address,:zip,:country
  end
end
