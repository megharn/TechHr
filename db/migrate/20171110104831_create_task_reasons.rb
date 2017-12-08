class CreateTaskReasons < ActiveRecord::Migration[5.1]
  def change
    create_table :task_reasons do |t|
      t.integer :user_id
      t.integer :task_id
      t.text :reasons

      t.timestamps
    end
  end
end
