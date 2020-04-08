# frozen_string_literal: true

class Location < ApplicationRecord
  validates :slug, presence: true, uniqueness: true
  validates :density_of_population, presence: true
end
