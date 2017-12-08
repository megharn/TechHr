class AddUserIdToUserLog < ActiveRecord::Migration[5.1]
  def change
    add_column :user_logs, :user_id, :integer
  end
end
