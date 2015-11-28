class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :FirstName
      t.string :LastName
      t.string :Phone
      t.string :Time
      t.timestamps null: false
    end
  end
end
