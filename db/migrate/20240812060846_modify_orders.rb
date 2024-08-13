class ModifyOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :user_id, :integer
    remove_column :orders, :status, :string

    change_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :status, default: 'cart', null: false
    end
  end
end
