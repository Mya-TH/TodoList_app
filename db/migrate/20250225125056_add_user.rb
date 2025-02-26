class AddUser < ActiveRecord::Migration[8.0]
  def change
    add_column :todos, :user_id, :integer
    add_index :todos, :user_id  # Optional: adds an index for faster lookups
    add_foreign_key :todos, :users  # This adds a foreign key constraint
  end
end
