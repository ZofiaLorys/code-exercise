# frozen_string_literal: true

class Location::SpeedOnSpread < Callable
  param :density_of_population
  param :transport

  def call
    transport_exist? ? density_factor : density_factor / 2
  end

  private

  def density_factor
    case density_of_population
    when 1..2999
      1.1
    when 3000..4999
      1.8
    when 5000..9999
      2.5
    else
      5.0
    end
  end

  def transport_exist?
    transport == 'true'
  end
end
