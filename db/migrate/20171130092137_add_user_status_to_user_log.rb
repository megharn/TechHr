class AddUserStatusToUserLog < ActiveRecord::Migration[5.1]
  def change
    add_column :user_logs, :user_status, :string
  end
end
