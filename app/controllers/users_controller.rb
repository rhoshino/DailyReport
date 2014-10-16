class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all
    respond_to do |format|

      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new()
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  # PUT /reports/1
  # PUT /reports/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
