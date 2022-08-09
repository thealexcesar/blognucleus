class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user, :admin?
  before_action :set_user, only: [ :show, :edit, :update, :destroy ]

  # ====================================================================================================================
  def index
    @users = User.all
  end
  # ====================================================================================================================
  def show
  end
  # ====================================================================================================================
  def new
    @user = User.new
  end
  # ====================================================================================================================
  def edit
  end
  # ====================================================================================================================
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_user_path(@user), notice: Translate.created_msg(controller_name.classify) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  # ====================================================================================================================
  def update
    puts "\n\n\n\naqui:\n#{@user}\n\n\n"
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to "/", notice: Translate.updated_msg(controller_name.classify) }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  # ====================================================================================================================
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: Translate.destroyed_msg(controller_name.classify) }
      format.json { head :no_content }
    end
  end

  # ====================================================================================================================
  # PRIVATE! ===========================================================================================================
  # ====================================================================================================================
  private
  def set_user
    @user = User.find_by_id params[:id]
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_type)
  end
end
