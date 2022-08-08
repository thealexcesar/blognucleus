class CreateAdminUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_users do |t|
      t.boolean :admin

      t.timestamps
    end
  end
end
