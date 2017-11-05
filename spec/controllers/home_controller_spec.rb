require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let!(:list_of_books) { FactoryGirl.create_list(:book, 7) }

  describe "GET :index" do
    before { get :index }

    it "#index render tamplate" do
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end

    it 'assigns @new_books' do
      expect(assigns(:new_books)).to match_array(list_of_books.last(3))
    end
    it 'assigns @books' do
      expect(assigns(:books)).not_to be_nil
    end
  end
end
