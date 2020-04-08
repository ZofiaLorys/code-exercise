# frozen_string_literal: true

class LocationsController < ApplicationController
  def show
    render json: {
      text: response_text
    }
  end

  def response_text
    return 'no location selected' unless permitted_params[:location].present?

    Location::RatioForLocation.call(permitted_params)
  end

  private

  def permitted_params
    params.permit(:location, :transport)
  end
end
