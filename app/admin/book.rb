ActiveAdmin.register Book do
    includes :authors, :category, :images
    permit_params :id, :category_id, :title, :price, :description, :materials, :dimensions, :year_of_publication, :active, author_ids: [], images_attributes: [:id, :file, :book_id, :_destroy]
    form partial: 'form'

    index do
      selectable_column
      column :id
      column 'Images' do |book|
        book.images.map{|i| image_tag(i.file, size: '50x60') }.join.html_safe
      end
      column('Category') { |book| book.category.name }
      column :title
      column('Authors') { |book| authors_name_select(book) }
      column('Description') { |book| truncate(book.description, length: 75) }
      column :price
      column '' do |book|
        (link_to 'View', edit_admin_book_path(book)) + ' - ' +
        (link_to 'Delete', admin_book_path(book), method: :delete,
          data: { confirm: 'Are you sure you want to delete this items?' })
      end
    end

    form html: { multipart: true } do |f|
      f.inputs 'Resource Details' do
        f.input :active
        f.input :title
        f.input :authors, as: :select, collection:
          Author.pluck(:name, :id), include_blank: false
        f.input :price
        f.input :category, as: :select, collection:
          Category.pluck(:name, :id), include_blank: false
        f.input :description
        f.input :materials
        f.input :dimensions
        f.input :year_of_publication
        hint = f.object.images.map { |i| image_tag(i.file, size: '50x60') }
          .join.html_safe if f.object.images
        f.input :images, as: :file, required: true,
          input_html: { multiple: true}, hint: hint
      end
      f.actions
    end

    controller do
      def update(options = {}, &block)
        if params[:book].key?(:images)
          params[:book][:images].each do |img|
            Image.create(book_id: params[:id], file: img)
          end
        end

        super do |success, failure|
          block.call(success, failure) if block
          failure.html { render :edit }
        end
      end
    end

    show do
      render 'admin/form', book: book
    end
end
