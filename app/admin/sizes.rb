ActiveAdmin.register Size do
  permit_params :size

  form do |f|
    f.inputs 'Size Details' do
      f.input :size
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :size
    actions
  end

  filter :size
end
