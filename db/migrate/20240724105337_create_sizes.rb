class CreateSizes < ActiveRecord::Migration[7.1]
  def change
    create_table :sizes do |t|
      t.integer :size, default: 0
      t.integer :quantity

      t.timestamps
    end
  end
end
