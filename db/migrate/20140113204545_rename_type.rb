class RenameType < ActiveRecord::Migration
  def change
    rename_column :identity_types, :type, :identity_kind
  end
end
