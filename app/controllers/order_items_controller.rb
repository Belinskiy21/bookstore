class OrderItemsController < ApplicationController

  def create
    @order = current_order
    book = Book.find_by(params[:id])
    @order_item = @order.order_items.build(book_id: book.id)

    respond_to do |format|
      if @order_item.save
        format.html { redirect_to  book_path(book),
            notice: 'Order item was successfully created.'}
        format.json { render json: @order_item,
            status: :created, location: @order_item}
      else
        format.html {redirect_to book_path(book),
            alert: 'Order item not created!'}
        format.json { render json: @order_item.errors,
            status: :unprocessable_entity }

      end
    end
  end
end
