class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user, :admin?, except: [:login, :do_login, :create]
  before_action :set_user, only: %i[ show edit update destroy ]

  layout "admin"

  def login
    @user_exists = true

    unless User.exists?
      @user_exists = false
      @user = User.new
    end

    render layout: "login"
  end

  #==========================================================
  def logout
    unless @current_user.blank?
      session[:email] = nil
      session[:uid]   = nil
      reset_session
    end
    redirect_to login_admin_users_url
  end

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to edit_admin_user_path(@user), notice: Translate.created_msg(controller_name.classify) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_admin_user_path(@user), notice: Translate.updated_msg(controller_name.classify) }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: Translate.destroyed_msg(controller_name.classify) }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by_id params[:id]
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :user_type)
  end
end
