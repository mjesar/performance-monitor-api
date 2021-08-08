class TestFailedMailer < ApplicationMailer
  def test_fail(test)
    @tests = test
    mail(from: 'ali@example.com', to: 'ali@example.com', subject: 'welcome')
  end
end
