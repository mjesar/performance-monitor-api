class SpeedTestInsight
  def initialize(params)
    @params = params
  end

  def call
    performance_monitor
  end

  private

  def performance_monitor
    response = HTTParty.get("https://www.googleapis.com/pagespeedonline/v5/runPagespeed?key=AIzaSyBXLkGtNEMKcXXjj1Kv-h8okmloFLM-h94&strategy=desktop&url=#{@params['url']}")
    payload = ::JSON.parse(response.body)
    lighthouse_results(payload)
  end

  def lighthouse_results(payload)
    ttfb = payload['lighthouseResult']['audits']['first-contentful-paint']['numericValue'].to_i
    ttfp = payload['lighthouseResult']['audits']['first-meaningful-paint']['numericValue'].to_i
    tti = payload['lighthouseResult']['audits']['interactive']['numericValue'].to_i
    speed_index = payload['lighthouseResult']['audits']['speed-index']['numericValue'].to_i
    payload_hash = { ttfb: ttfb, ttfp: ttfp, tti: tti, speed_index: speed_index }
    test_pass = check_test?(payload_hash)
    payload_hash.merge! passed: test_pass
  end

  def check_test?(payload_hash)
    if payload_hash[:ttfb] > @params[:max_ttfb].to_i
      false
    elsif payload_hash[:ttfp] > @params[:max_ttfp].to_i
      false
    elsif payload_hash[:tti] > @params[:max_tti].to_i
      false
    elsif payload_hash[:speed_index] > @params[:max_speed_index].to_i
      false
    else
      true
    end
  end
end
