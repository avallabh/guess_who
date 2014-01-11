class ChangingUidName < ActiveRecord::Migration
  def change
    rename_column :users, :github_uid, :uid
  end
end
