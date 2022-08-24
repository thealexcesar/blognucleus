class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user, :admin?
  before_action :set_post, only: [:show, :show_draft]

  layout 'admin'
  # ====================================================================================================================
  def index
    query = Post.filter params
    @posts = Post.where(query).order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end
  # ====================================================================================================================
  def show
    @comment = @post.comments.new unless @post.blank?
    @comments = Comment.where(post_id: @post).order("created_at ASC")
  end
  # ====================================================================================================================
  def show_draft
  end
  # ====================================================================================================================
  # PRIVATE ============================================================================================================
  # ====================================================================================================================
  private
  def set_post
    @post = Post.find_by_id params[:id]
  end
  # ====================================================================================================================
end