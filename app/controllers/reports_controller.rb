#coding:utf-8
class ReportsController < ApplicationController

  # GET /reports
  # GET /reports.json
  #@users = User.all
  def index
    # TODO: current_user.role.typeとかで表示を分岐
    # @reports = Report.all
    # @reports = Report.where(:user_id => current_user)
    # @user = params[:user_id] ? User.find(params[:user_id]) : current_user
    # @reports = @user.reports
    @reports = current_user.reports

    #@reports = current_user.reports.where("public_flag = 'true'")
    respond_to do |format|

      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end

  def list

      @reports = Report.all
      respond_to do |format|

        format.html # index.html.erb
        format.json { render json: @reports }
      end
  end
  def mounth

      @reports = current_user.reports.where("public_flag = 'true'")
      respond_to do |format|

        format.html # index.html.erb
        format.json { render json: @reports }
      end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report = Report.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    #@report = Report.new({:reportTitle => "こんにちは",:user_id => current_user})
    @report = Report.new()
    @report.worktimes.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/1/edit
  def edit
    @report = Report.find(params[:id])
  end

  # POST /reports
  # POST /reports.json
  def create
    #@report = Report.new(params[:report])
    @report = current_user.reports.new(params[:report])
    #@report.build_worktime
    #@worktime = Worktime.new()
    # @report = Report.new(params[:report].merge(params[:user_id]))
    respond_to do |format|
      if @report.save

        ApplicationController.helpers.sending_report_submit(@report.user,@report)

        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render json: @report, status: :created, location: @report }
      else
        format.html { render action: "new" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.json
  def update
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])

        ApplicationController.helpers.sending_report_submit(@report.user,@report)

        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_path }
      format.json { head :no_content }
    end
  end
end
