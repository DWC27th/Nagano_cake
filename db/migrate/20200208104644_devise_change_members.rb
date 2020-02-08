class DeviseChangeMembers < ActiveRecord::Migration[5.2]
  def change
  	add_index :members, :last_name
  	add_index :members, :last_name_kana
  	add_index :members, :first_name
  	add_index :members, :first_name_kana
  end
end