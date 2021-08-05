class Api::V1::TestsController < ApplicationController
  
  def create
    test_data = Test.new(test_params.merge(lighthouse_results))
    if test_data.save
      render json: test_data
    else
      render json: test_data.errors, status: :unprocessable_entity
    end
  end

  private

  def test_params
    params.require(:test).permit(:url, :max_ttfb, :max_tti, :max_speed_index, :max_ttfp)
  end

  def performance_monitor
    response = HTTParty.get("https://www.googleapis.com/pagespeedonline/v5/runPagespeed?key=AIzaSyBXLkGtNEMKcXXjj1Kv-h8okmloFLM-h94&strategy=desktop&url=#{test_params['url']}")
    ::JSON.parse(response.body)
  end

  def lighthouse_results
    payload = performance_monitor    
    ttfb = payload['lighthouseResult']['audits']['first-contentful-paint']['numericValue']
    ttfp = payload['lighthouseResult']['audits']['first-meaningful-paint']['numericValue']
    tti = payload['lighthouseResult']['audits']['interactive']['numericValue']
    speed_index = payload['lighthouseResult']['audits']['speed-index']['numericValue']
    { "ttfb" => ttfb, "ttfp" => ttfp, "tti" => tti, "speed_index" => speed_index}
  end
end
