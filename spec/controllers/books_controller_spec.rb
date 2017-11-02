require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:book) { FactoryGirl.create(:book) }

  describe "GET #index" do
    before { get :index }
    it 'render index template and return success response' do
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it 'assigns @books, @order_item and @book_count' do
      expect(assigns(:books)).not_to be_nil
      expect(assigns(:book_count)).not_to be_nil
      expect(assigns(:order_item)).not_to be_nil
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: book.to_param } }

    it 'render show template and return success response' do
      expect(response).to be_success
      expect(response).to render_template :show
    end

    it 'assign @book,@reviews, @order_item' do
      expect(assigns(:book)).not_to be_nil
      expect(assigns(:reviews)).not_to be_nil
      expect(assigns(:order_item)).not_to be_nil
    end
  end

  describe 'GET newest_first ' do
    before { get :newest_first }
      it 'return a success response' do
      expect(response).to be_success
      expect(response).to render_template :index
    end
    it 'aasigns @books' do
      expect(assigns(:books)).not_to be_nil
    end
  end

  describe 'GET popular_first ' do
    before { get :popular_first }
      it 'return a success response' do
      expect(response).to be_success
      expect(response).to render_template :index
    end
    it 'aasigns @books' do
      expect(assigns(:books)).not_to be_nil
    end
  end

  describe 'GET price_descending ' do
    before { get :price_descending }
      it 'return a success response' do
      expect(response).to be_success
      expect(response).to render_template :index
    end
    it 'aasigns @books' do
      expect(assigns(:books)).not_to be_nil
    end
  end

  describe 'GET price_ascending ' do
    before { get :price_ascending }
      it 'return a success response' do
      expect(response).to be_success
      expect(response).to render_template :index
    end
    it 'aasigns @books' do
      expect(assigns(:books)).not_to be_nil
    end
  end

  describe 'GET title_descending ' do
    before { get :title_descending }
      it 'return a success response' do
      expect(response).to be_success
      expect(response).to render_template :index
    end
    it 'aasigns @books' do
      expect(assigns(:books)).not_to be_nil
    end
  end

  describe 'GET title_ascending ' do
    before { get :title_ascending }
      it 'return a success response' do
      expect(response).to be_success
      expect(response).to render_template :index
    end
    it 'aasigns @books' do
      expect(assigns(:books)).not_to be_nil
    end
  end
end
