class Api::TestsController < ApplicationController
  def index
    render json: set_tests
  end

  def create
    speed_test_insights = speed_test_insight
    test_data = Test.new(test_params.merge(speed_test_insights))
    if test_data.save
      render json: speed_test_insights
    else
      render json: test_data.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: set_tests.last
  end

  private

  def test_params
    params.permit(:url, :max_ttfb, :max_tti, :max_speed_index, :max_ttfp)
  end

  def speed_test_insight
    SpeedTestInsight.new(test_params).call
  rescue StandardError
    nil
  end

  def set_tests
    Test.where(params.permit(:url))
  end
end
