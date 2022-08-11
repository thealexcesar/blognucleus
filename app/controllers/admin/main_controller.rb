class Admin::MainController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user, :admin?

  # ====================================================================================================================
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 4)
    @users = User.all.paginate(page: params[:page], per_page: 4)
    @drafts = Post.where(status: :draft).order('created_at ASC').paginate(page: params[:page], per_page: 4)
    @published = Post.where(status: :published).order('created_at ASC').paginate(page: params[:page], per_page: 4)
  end
  # ====================================================================================================================
end