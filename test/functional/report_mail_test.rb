require 'test_helper'

class ReportMailTest < ActionMailer::TestCase
  test "report_submitted" do
    mail = ReportMail.report_submitted
    assert_equal "Report submitted", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
