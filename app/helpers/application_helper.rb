module ApplicationHelper


  def calc_time
    hours = 0
    minutes = 0
    report_all = current_user.reports
    #まず開始時間と終了時間のリストを作成する。
    report_all.each do |report|
      report.worktimes.each do |w|
        hours += (w.end_time.hour - w.start_time.hour)
        minutes += (w.end_time.min - w.start_time.min)
      end
    end

    return {:hour => hours, :minute => minutes}

  end#def calc_user_worktime

end
