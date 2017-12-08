class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :mobile_no, :string
    add_column :users, :communication_address, :text
    add_column :users, :permanent_address, :text
    add_column :users, :reference_no, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :blood_group, :string
  end
end
