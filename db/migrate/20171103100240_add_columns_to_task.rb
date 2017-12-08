class AddColumnsToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :status, :string
    add_column :tasks, :completed_date, :date
    add_column :tasks, :priority, :string
  end
end
