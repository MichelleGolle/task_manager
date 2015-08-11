class RenameTaskStatus < ActiveRecord::Migration
  def change
    rename_column :tasks, :status, :completed
  end
end
