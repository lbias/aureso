require 'rails_helper'

RSpec.describe Api::V1::ModelsController, type: :controller do
  before(:each) do
    @organization = FactoryGirl.create(:organization)
    @model = FactoryGirl.create(:model, organization: @organization)
    @model_type = FactoryGirl.create(:model_type, model: @model)

    allow_any_instance_of(Fixed).to receive(:total_price).and_return(100)
  end

  let(:params) {
    { model_slug: 'serie_1', model_type_slug: '125i', base_price: 10 }
  }

  describe '#authenticate_token' do
    it 'returns 401 without valid token' do
      get :model_types, {model_slug: 'serie_1'}
      expect(response.status).to eq(401)
    end
  end

  describe 'GET #model_types' do
    it 'returns models and model types' do
      request.env['HTTP_AUTHORIZATION'] = 'Token token=secret'
      get :model_types, params.slice(:model_slug)

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json['models']).not_to be_empty
      expect(json['models'][0]['model_types']).not_to be_empty
    end
  end

  describe 'POST #model_types_price' do
    it 'updates base price and returns model type data' do
      request.env['HTTP_AUTHORIZATION'] = 'Token token=secret'
      post :model_types_price, params

      model_type = JSON.parse(response.body)['model_type']

      expect(response).to be_success
      expect(model_type).to eq({'name' => 'bmw_125i', 'base_price' => 10, 'total_price' => 100})
    end
  end
end
