# frozen_string_literal: true

class Location::SpeedOnSpread < Callable
  def initialize(density_of_population, transport)
    @transport = transport
    @density_of_population = density_of_population
  end

  def call
    return density_factor unless @transport == "false"

    density_factor / 2
  end

  private

  def density_factor
    case @density_of_population
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
end
