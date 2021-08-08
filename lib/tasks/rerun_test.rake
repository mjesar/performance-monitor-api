namespace :rerun_test do
  desc 'tests to rerun on a specified interval'
  task run_test: :environment do
    Test.all.each do |each_test|
      payload_hash = { 'url' => each_test.url, 'max_ttfb' => each_test.max_ttfb, 'max_tti' => each_test.max_tti,
                        'max_speed_index' => each_test.max_speed_index, 'max_ttfp' => each_test.max_ttfp }
      speed_test_insight = SpeedTestInsight.new(payload_hash).call
      TestFailedMailer.test_fail(payload_hash.merge(speed_test_insight)).deliver_now
    end
  end
end
