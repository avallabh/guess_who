class ChangeNameOfTable < ActiveRecord::Migration
  def change
    rename_table :member_informations, :member_identities
  end
end
