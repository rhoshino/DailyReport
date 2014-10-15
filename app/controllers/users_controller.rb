class UsersController < ApplicationController
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

end