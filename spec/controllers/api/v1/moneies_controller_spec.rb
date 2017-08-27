require 'rails_helper'

RSpec.describe Api::V1::MoneiesController, type: :controller do
  describe '#index' do
    let!(:moneies) { create_list(:money, 3) }

    before { get :index }

    it :aggregate_failures do
      expect(assigns(:moneies)).to include moneies.first
      expect(response).to have_http_status 200
    end
  end

  describe '#show' do
    let!(:money) { create(:money) }

    before { get :show, params: { id: money.id } }

    it :aggregate_failures do
      expect(assigns(:money)).to eq money
      expect(response).to have_http_status 200
    end
  end

  describe '#create' do

    context 'sucess' do
      let(:money) { attributes_for(:money) }

      before { post :create, params: { money: money }, format: :json }

      it :aggregate_failures do
        expect(assigns(:money).price).to eq money[:price]
        expect(response).to have_http_status 200
      end
    end

    context 'faild' do
      let(:money) { attributes_for(:money, price: nil) }

      before { post :create, params: { money: money }, format: :json }

      it :aggregate_failures do
        expect(assigns(:money).errors).not_to be_empty
        expect(response).to have_http_status 400
      end
    end
  end
end
