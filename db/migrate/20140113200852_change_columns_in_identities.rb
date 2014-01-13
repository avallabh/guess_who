class ChangeColumnsInIdentities < ActiveRecord::Migration
  def up
    remove_column :identities, :key
    add_column :identities, :identity_type_id, :integer
  end

  def down
    add_column :identities, :key, :string
    remove_column :identities, :identity_type_id
  end
end
