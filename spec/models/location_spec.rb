# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    let!(:location) { create(:location) }
    it { is_expected.to validate_presence_of(:slug) }
    it { is_expected.to validate_presence_of(:density_of_population) }
  end
end
