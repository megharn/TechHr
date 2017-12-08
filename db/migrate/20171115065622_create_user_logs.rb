class CreateUserLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_logs do |t|
      t.datetime :log_in_time
      t.datetime :sign_out_time

      t.timestamps
    end
  end
end
