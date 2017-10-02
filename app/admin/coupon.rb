ActiveAdmin.register Coupon do
  permit_params :code, :discount


  index do
    selectable_column
    id_column
    column :code
    column :discount
    actions
  end

  form do |f|
    f.inputs do
      f.input :code
      f.input :discount
    end
    f.actions
  end
end
