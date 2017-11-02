require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:order) { FactoryGirl.create(:order, user_id: user.id) }
  before { sign_in(user) }

  describe 'GET #index' do
    before { get :index }

    it 'assign @orders' do
      expect(assigns(:orders)).not_to be_nil
      expect(response).to render_template :index
    end

    it 'return http status success' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: order.id } }

    it 'assign @order' do
      expect(assigns(:order)).not_to be_nil
    end

    it 'return http status success' do
      expect(response).to have_http_status(:ok)
    end

    it 'render template show' do
      expect(response).to render_template :show
    end
  end

  describe 'GET in_progress' do
    before { get :in_progress, params: { id: order.id } }
    context 'order with status in_progress' do
      let(:order_in_progress) {  FactoryGirl.create(:order, order_state: :in_progress, user_id: user.id) }
      before { get :show, params: { id: order_in_progress.id } }

      it 'return redirect status code' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET processing " do
    before { get :processing, params: { id: order.id } }
    context 'order with order_state processing' do
      let(:order_processing) {  FactoryGirl.create(:order_processing, user_id: user.id) }
      before { get :show, params: { id: order_processing.id } }

      it 'return redirect status code' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET in_delivery " do
    before { get :in_delivery, params: { id: order.id } }
    context 'order with order_state in_delivery' do
      let(:order_in_delivery) {  FactoryGirl.create(:order_in_delivery, user_id: user.id) }
      before { get :show, params: { id: order_in_delivery.id } }

      it 'return redirect status code' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET delivered " do
    before { get :delivered, params: { id: order.id } }
    context 'order with order_state delivered' do
      let(:order_delivered) {  FactoryGirl.create(:order_delivered, user_id: user.id) }
      before { get :show, params: { id: order_delivered.id } }

      it 'return redirect status code' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET canceled " do
    before { get :canceled, params: { id: order.id } }
    context 'order with order_state canceled' do
      let(:order_canceled) {  FactoryGirl.create(:order_canceled, user_id: user.id) }
      before { get :show, params: { id: order_canceled.id } }

      it 'return redirect status code' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
