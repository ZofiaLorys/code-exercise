# frozen_string_literal: true

class Location::RatioForLocation < Callable
  param :location
  param :transport, default: proc { 'true' }

  def call
    transport_validation_error unless @transport.in? %w[true false]
    Location::SpeedOnSpread.call(@location.density_of_population, @transport)
  end

  private

  def transport_validation_error
    raise ArgumentError, 'Transport not a boolean'
  end
end
