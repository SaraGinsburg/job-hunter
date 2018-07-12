class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :username, :profession, :city, :password, :password_confirmation))
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      #redirect to their dashboard or user show page
      redirect_to user_path(@user.username)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.update(user_params(:name, :username, :profession, :city))
    redirect_to user_path(@user.username)
  end

  def show
    @tasks = @user.tasks
    @my_applications = @user.job_applications
    @general_tasks = @tasks.select{|task| task.job_application_id == nil}
    @events = @user.events.order(:date)
  end

  def destroy
  end

  private

  def find_user
    @user = User.find_by(username: params[:username])
  end

  def user_params(*args)
    params.require(:user).permit(*args)
  end
end
