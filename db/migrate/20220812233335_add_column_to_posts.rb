class AddColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :category, :string
    add_column :posts, :top, :integer
    add_column :posts, :image, :string
  end
end
