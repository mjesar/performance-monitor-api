class Api::V1::PerformanceMonitorController < ApplicationController
  def show

    render json: 'request'
  end
end
