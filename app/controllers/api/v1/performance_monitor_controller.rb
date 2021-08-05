class Api::V1::PerformanceMonitorController < ApplicationController
  def show
  	begin
      # HTTParty.get('http://google.com')
    response = HTTParty.get("https://www.googleapis.com/pagespeedonline/v5/runPagespeed?key=AIzaSyBXLkGtNEMKcXXjj1Kv-h8okmloFLM-h94&strategy=desktop&url=https://developers.google.com")
    Rails.logger.info "SUCCESS #{response}"
    payload = ::JSON.parse(response.body)
    # render json: payload['loadingExperience']['metrics']['FIRST_CONTENTFUL_PAINT_MS']

    ttfb = payload['lighthouseResult']['audits']['first-contentful-paint']['numericValue']
    ttfp = payload['lighthouseResult']['audits']['first-meaningful-paint']['numericValue']
    tti = payload['lighthouseResult']['audits']['interactive']['numericValue']
    index_speed = payload['lighthouseResult']['audits']['speed-index']['numericValue']
    render json: ttfp
    rescue HTTParty::Error => e
    render json: e
    Rails.logger.info "HTTPartyError"
   # don´t do anything / whatever
    rescue StandardError => e 
    render json: e
    Rails.logger.info "StandardError"
   # rescue instances of StandardError,
   # i.e. Timeout::Error, SocketError etc
    end
  end
end
