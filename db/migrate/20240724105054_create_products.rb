class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :size, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.decimal :price

      t.timestamps
    end
  end
end
