require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:order) { FactoryGirl.create(:order, :with_order_item, user_id: user.id) }
  describe 'GET #show' do
    before { get :show, params: { id: order.id } }

    it 'assign @current_order' do
      expect(assigns(:current_order)).not_to be_nil
    end

    it 'return success response with show template' do
      expect(response).to be_success
      expect(response).to render_template :show
    end
  end

  describe 'POST #update' do
    let!(:coupon) { FactoryGirl.create(:coupon, code: 'D1234', discount: 0.2) }

    context 'fake coupon' do
      before { post :update, params: { id: order.id, code: 'invalid coupon' } }
      it 'redirect to Cart' do
        expect(response).to redirect_to cart_path(order.id)
      end

      it 'show error message' do
        expect(flash[:notice]).to eq I18n.t('wrong_coupon')
      end
    end

  end
end
