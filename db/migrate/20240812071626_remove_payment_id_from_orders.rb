class RemovePaymentIdFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :payment_id, :integer
  end
end
