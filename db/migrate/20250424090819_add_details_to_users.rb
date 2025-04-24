class AddDetailsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :email, :string, null: false, default: ""
    add_column :users, :is_admin, :boolean, default: false
    add_index :users, :email, unique: true
  end
end
