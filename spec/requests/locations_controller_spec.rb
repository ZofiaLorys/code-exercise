# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationsController, type: :request do
  describe 'GET #location' do
    context 'when transport is set to true' do
      let(:location) { create(:location, density_of_population: 1) }
      let(:params) do
        {
          location: location.slug,
          transport: 'true'
        }
      end
      let(:response_body) { { ratio: 1.1 } }
      it 'renders correct response' do
        get '/location', params: params
        expect(response.body).to eq response_body.to_json
      end
    end

    context 'when transport is set to false' do
      let(:location) { create(:location, density_of_population: 1) }
      let(:params) do
        {
          location: location.slug,
          transport: 'false'
        }
      end
      let(:response_body) { { ratio: 0.55 } }
      it 'renders correct response' do
        get '/location', params: params
        expect(response.body).to eq response_body.to_json
      end
    end

    context 'when location isnt found' do
      let(:params) { { location: 'valid-location' } }
      let(:response_body) { { error: 'location not found' } }
      it 'renders error response' do
        get '/location', params: params
        expect(response.body).to eq response_body.to_json
      end
    end

    context "when location param isn't sent " do
      let(:params) { {} }
      let(:response_body) { { error: 'no location selected' } }
      it 'renders error response' do
        get '/location', params: params
        expect(response.body).to eq response_body.to_json
      end
    end
  end
end
