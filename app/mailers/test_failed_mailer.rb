class TestFailedMailer < ApplicationMailer
  def test_fail(test)
    @url = test['url']
    @max_ttfb = test['max_ttfb']
    @max_ttfp = test['max_ttfp']
    @max_tti = test['max_tti']
    @max_speed_index = test['max_speed_index']
    @ttfb = test[:ttfb]
    @ttfp = test[:ttfp]
    @tti = test[:tti]
    @speed_index = test[:speed_index]
    @passed = test[:passed]
    mail(from: 'ali@example.com', to: 'ali@example.com', subject: 'Scheduled Test Result')
  end
end
