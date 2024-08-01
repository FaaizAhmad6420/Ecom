ActiveAdmin.register Customer do
  permit_params :username, :email, :password, :password_confirmation, :avatar

  form do |f|
    f.inputs 'Customer Details' do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :avatar, as: :file
    end
    f.actions
  end

  filter :username
  filter :email
  filter :created_at

  show do
    attributes_table do
      row :username
      row :email
      row :avatar do |customer|
        image_tag url_for(customer.avatar) if customer.avatar.attached?
      end
      row :created_at
      row :updated_at
    end
  end

  index do
    selectable_column
    id_column
    column :username
    column :email
    column :avatar do |customer|
      customer.avatar.attached? ? customer.avatar.filename.to_s : 'No Image'
    end
    actions
  end
end
