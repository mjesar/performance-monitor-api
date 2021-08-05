class Api::V1::TestsController < ApplicationController
  def create
  	render json: ttfb
  end

  private

  def test_params
    params.require(:test).permit(:url, :max_ttfb, :max_tti, :max_speed_index, :max_ttfp)
  end

  def performance_monitor
    response = HTTParty.get("https://www.googleapis.com/pagespeedonline/v5/runPagespeed?key=AIzaSyBXLkGtNEMKcXXjj1Kv-h8okmloFLM-h94&strategy=desktop&url=#{test_params['url']}")
    payload = ::JSON.parse(response.body)
  end

  def ttfb
     performance_monitor['lighthouseResult']['audits']['first-contentful-paint']['numericValue']
  end

  def ttfp
    performance_monitor['lighthouseResult']['audits']['first-meaningful-paint']['numericValue']
  end

  def tti
     performance_monitor['lighthouseResult']['audits']['interactive']['numericValue']
  end

  def index_speed
     payload['lighthouseResult']['audits']['speed-index']['numericValue']
  end
end
