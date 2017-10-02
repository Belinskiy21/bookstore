ActiveAdmin.register ShippingMethod do
permit_params :name, :price, :min_days, :max_days

end
