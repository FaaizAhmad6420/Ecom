ActiveAdmin.register Product do
  permit_params :name, :description, :category_id, :price, product_sizes_attributes: [:id, :size_id, :quantity, :_destroy]

  form do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :description
      f.input :category, as: :select, collection: Category.all.map { |c| [c.display_name, c.id] }
      f.input :price
    end

    f.has_many :product_sizes, allow_destroy: true, new_record: true do |ps|
      ps.input :size, as: :select, collection: Size.all.map { |s| [s.display_name, s.id] }
      ps.input :quantity
    end
    f.actions
  end

  filter :name
  filter :category, as: :select, collection: Category.all.map { |c| [c.display_name, c.id] }
  filter :price
  filter :created_at

  show do
    attributes_table do
      row :name
      row :description
      row :category do |product|
        product.category.display_name
      end
      row :price
      row :created_at
      row :updated_at
    end

    panel "Sizes and Quantities" do
      table_for product.product_sizes do
        column :size do |product_size|
          product_size.size.display_name
        end
        column :quantity
      end
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :category do |product|
      product.category.display_name
    end
    column :price
    actions
  end
end
