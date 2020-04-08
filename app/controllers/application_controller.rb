# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :render_bad_request
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ArgumentError, with: :render_bad_type

  def render_bad_request
    render json: { error: 'no location selected' }, status: :bad_request
  end

  def render_not_found_response
    render json: { error: 'location not found' }, status: :not_found
  end

  def render_bad_type
    render json: { error: 'transport must be a boolean type' }, status: :bad_request
  end
end
