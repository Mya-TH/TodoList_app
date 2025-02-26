class AddIsDoneToTodos < ActiveRecord::Migration[8.0]
  def change
    add_column :todos, :is_done, :boolean, default: false
  end
end
