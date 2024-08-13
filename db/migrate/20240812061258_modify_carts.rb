class ModifyCarts < ActiveRecord::Migration[7.1]
  def change
    change_table :carts do |t|
      t.integer :quantity
      t.decimal :price
    end
  end
end
