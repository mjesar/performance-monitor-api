namespace :rerun_test do
  desc 'tests to rerun on a specified interval'
  task run_test: :environment do
    # url = 'https://www.vice.com/en'

    # Rails.logger.info "rerun_test #{}"
    array = []
    Test.all.each do |each_test|
      payload_hash = {"url"=>each_test.url, "max_ttfb"=>each_test.max_ttfb, "max_tti"=>each_test.max_tti, "max_speed_index"=>each_test.max_speed_index, "max_ttfp"=>each_test.max_ttfp}
      speed_test_insight = SpeedTestInsight.new(payload_hash).call
      # puts speed_test_insight.merge!(id: each_test.id, url: each_test.url)
      array.push(speed_test_insight)
    end
    p array
  end
end
