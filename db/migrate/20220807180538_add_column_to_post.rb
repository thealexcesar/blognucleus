class AddColumnToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :status, :integer, default: :draft
  end
end
