# frozen_string_literal: true

class Location::RatioForLocation < Callable
  def initialize(params)
    @location_param = params[:location]
    @transport_param = params[:transport]
  end

  def call
    return 'location not found' unless location.present?

    Location::SpeedOnSpread.call(location.density_of_population, @transport_param)
  end

    private

  def location
    Location.find_by slug: @location_param
  end
  end
