namespace :rerun_test do
  desc 'tests to rerun on a specified interval'
  task run_test: :environment do
    # url = 'https://www.vice.com/en'
    payload_hash = {"url"=>"https://www.vice.com/en", "max_ttfb"=>"990", "max_tti"=>"54440", "max_speed_index"=>"73970", "max_ttfp"=>"990"}

    speed_test_insight = SpeedTestInsight.new(payload_hash).call
    # Rails.logger.info "rerun_test #{}"
    puts speed_test_insight
  end
end
