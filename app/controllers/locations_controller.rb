# frozen_string_literal: true

class LocationsController < ApplicationController
  def show
    render json: { ratio: ratio }
  end

  private

  def ratio
    @location = Location.find_by! slug: location
    Location::RatioForLocation.call(@location, params[:transport])
  end

  def location
    params.fetch(:location)
  end
end
