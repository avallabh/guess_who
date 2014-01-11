class CreateMemberInformations < ActiveRecord::Migration
  def change
    create_table :member_informations do |t|
      t.string :key, null:false
      t.string :value, null:false
      t.references :member, index: true

      t.timestamps
    end
  end
end
