class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name, null:false
      t.string :last_name, null:false
      t.string :role, null:false
      t.string :email, null:false
      t.string :gender, null:false

      t.timestamps
    end
  end
end
