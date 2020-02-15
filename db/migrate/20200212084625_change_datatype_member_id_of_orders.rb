class ChangeDatatypeMemberIdOfOrders < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :member_id, :integer
  end
end
