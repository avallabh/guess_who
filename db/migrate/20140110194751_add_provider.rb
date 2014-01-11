class AddProvider < ActiveRecord::Migration
  def up
    add_column :users, :provider, :string
  end

  def down
    remove_column :users, :provider
  end
end
