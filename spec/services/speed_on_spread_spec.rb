# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Location::SpeedOnSpread do
  let(:subject) { described_class.call(location.density_of_population, transport) }
  let(:location) { create(:location, density_of_population: 3000) }
  let(:ratio) { 1.8 }

  context 'when service is called with transport "true"' do
    let(:transport) { 'true' }
    it 'returns ratio' do
      expect(subject).to eq(ratio)
    end
  end

  context 'when service is called with transport "false"' do
    let(:transport) { 'false' }
    it 'returns ratio by half' do
      expect(subject).to eq(ratio / 2)
    end
  end
end
