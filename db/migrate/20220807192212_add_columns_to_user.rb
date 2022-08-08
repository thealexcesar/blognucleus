class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_type, :integer
    add_column :users, :name, :string

    change_column :users, :user_type, :integer, :default => 0
  end
end
