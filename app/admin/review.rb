ActiveAdmin.register Review do
permit_params :status, :content, :user_id, :book_id

index do
  selectable_column
  id_column
  column :user_id
  column :book
  column :content
  column :status
  column :rate
  actions
end

form do |f|
  f.inputs do
    f.input :user_id, as: :select, collection:
      User.pluck(:id), include_blank: false
    f.input :book
    f.input :content
    f.input :status
    f.input :rate
  end
  f.actions
end

end
