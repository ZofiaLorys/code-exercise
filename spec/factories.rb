# frozen_string_literal: true

# This will guess the User class
FactoryBot.define do
  factory :location do
    slug { 'cracow' }
    density_of_population { 150 }
  end
end
