class AddDetailsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :name, :string
    add_column :users, :contact, :string
    add_column :users, :role, :integer, default: 1
  end
end
