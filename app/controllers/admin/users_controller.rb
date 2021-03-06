class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    # @tasks = Task.all
    @tasks = Task.order(:created_at).includes(:user)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
       if current_user.present?
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
       else
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      end
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @user.id == current_user.id
      redirect_to admin_users_url, notice: "You can not delete signed in user"
      @admins = User.admins
    elsif @admins == 1
      redirect_to admin_users_url, notice: "At least one admin must remain!"
    else
      @user.destroy
      redirect_to admin_users_url, notice: 'User was successfully destroyed.'
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      if current_user.present?
        params.require(:user).permit(:name, :email, :password, :role)
      else
        params.require(:user).permit(:name, :email, :password)
      end
      
    end
end
