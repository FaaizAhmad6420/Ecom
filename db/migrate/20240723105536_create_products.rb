class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :category, default: 0, null: false
      t.integer :size, default: 0, null: false

      t.timestamps
    end
  end
end
