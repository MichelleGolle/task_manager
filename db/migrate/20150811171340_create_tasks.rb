class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :status
      t.text :notes
      t.date :due_date
      t.date :start_date
      t.references :list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
