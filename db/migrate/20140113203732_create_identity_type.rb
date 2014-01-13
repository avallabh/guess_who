class CreateIdentityType < ActiveRecord::Migration
  def change
    create_table :identity_types do |t|
      t.string :type
    end
  end
end
