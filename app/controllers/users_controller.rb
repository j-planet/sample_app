class UsersController < ApplicationController
  before_filter :redirect_if_not_signed_in, only: [:edit, :update, :index, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy
  before_filter :redirect_if_signed_in, only: [:new, :create]

  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy

    toBeDestroyedUser = User.find(params[:id])

    if toBeDestroyedUser == current_user
      flash[:error] = 'Cannot delete yourself.'
    else
      toBeDestroyedUser.destroy
      flash[:success] = 'User destroyed.'
    end

    redirect_to users_url
  end

  private

    def redirect_if_not_signed_in
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def redirect_if_signed_in
      redirect_to(root_path) if signed_in?
    end

end
