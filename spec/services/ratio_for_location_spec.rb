# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Location::RatioForLocation do
  let(:subject) { described_class.call(location, transport) }
  let(:location) { create(:location) }
  context 'when service is called with correct arguments' do
    let(:transport) { 'true' }

    it 'calls the service' do
      expect(Location::SpeedOnSpread).to receive(:call).with(location.density_of_population, transport)
      subject
    end
  end

  context 'when service is called with incorrect transport argument' do
    let(:transport) { 7 }

    it 'raises an error' do
      expect { subject }.to raise_error
    end
  end
end
