class Api::V1::TestsController < ApplicationController
  def create
  	render json: 'OK'
  end

  private

  def test_params
    params.require(:test).permit(:url, :max_ttfb, :max_tti, :max_speed_index, :max_ttfp)
  end
end
