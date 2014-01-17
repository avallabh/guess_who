class AddPhotoUrlToMembers < ActiveRecord::Migration
  def up
    add_column :members, :photo_url, :string, null: false
  end

  def down
    remove_column :members, :photo_url
  end
end
