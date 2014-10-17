module ReportsHelper
  def sending_report_submit(user,report)
    @user = user
    @report = report

    if report.public_flag?
      @mail = ReportMail.report_submitted(user).deliver
    end
  end
end
