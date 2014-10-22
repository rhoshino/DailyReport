module ReportsHelper
  def sending_report_submit(user,report)
    @user = user
    @report = report


    if report.public_flag? && @user.send_address != nil
      @mail = ReportMail.report_submitted(user,report).deliver
    end
  end
end
