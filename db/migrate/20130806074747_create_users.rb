class CreateUsers < ActiveRecord::Migration
  def up
    add_column :users, :lives, :integer, default: 4
    add_column :users, :current_bundle, :integer, :default => 1
    add_column :users, :password, :string
    add_column :users, :password_digest, :string
    add_column :users, :salt, :string
    add_column :users, :stage, :integer, :default => 0
    add_column :users, :email, :string
  end

  def down
  end
end
