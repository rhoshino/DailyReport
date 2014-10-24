module ReportsHelper
  def sending_report_submit(user,report)
    @user = user
    @report = report


    if report.public_flag? && @user.send_address != nil
      @mail = ReportMail.report_submitted(user,report).deliver
    end
  end


  def start_and_end_times_date_subsutiture(report)
    #年月日は報告日付を代入する。
    # HACK:とてもにおう
    #激しく臭うコードだと思っている。どうしよう。
    report.worktimes.each do |w|
      w.start_time.change(year: report.report_date.year)
      w.end_time.change(year: report.report_date.year)

      w.start_time.change(month: report.report_date.month)
      w.end_time.change(month: report.report_date.month)

      w.start_time.change(day: report.report_date.day)
      w.end_time.change(day: report.report_date.day)

    end
  end

end
