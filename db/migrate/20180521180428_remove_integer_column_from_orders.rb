class RemoveIntegerColumnFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :string, :integer
  end
end
