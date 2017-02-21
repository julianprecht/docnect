class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :require_valid, only: [:new, :create, :edit, :update, :destroy]

  before_action :require_logout, only: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    # @users = all patients of a doctor
  end

  def show
    @user = User.find(params[:id])
    @age = nil
    if @user.dob
      now = Time.zone.now
      @age = now.year - @user.dob.year - (@user.dob.to_time.change(:year => now.year) > now ? 1 : 0)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:info] = 'Please check your emails to activate your account!'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    params = nil
    if @user.user_group == 1
      params = patient_params
    elsif @user.user_group == 2
      params = doctor_params
    end

    if params && @user.update_attributes(params)
      flash[:info] = 'Profile successfully updated!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:info] = 'Account successfully deleted.'
    redirect_to root_url
  end

private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

  def patient_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :dob, :nationality, :marital_status, :occupation, :hobbies, :languages, :height, :weight, :allergies, :smoke, :alcohol, :tattoos, :history, :medication, :drugs, :illness)
  end

  def doctor_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :specialization, :phone, :address, :bio)
  end

  def require_correct_user
    @user = User.find(params[:id])
    redirect_to current_user unless current_user?(@user)
  end
end
