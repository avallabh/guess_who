class ChangeMemberIdentitiesTable < ActiveRecord::Migration
  def change
    rename_table :member_identities, :identities
  end
end
