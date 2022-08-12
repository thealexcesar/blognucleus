class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user, :admin?
  before_action :set_post, only: [:show, :show_draft]
  # ====================================================================================================================
  def index
    conditions = []
    values = {}
    unless params[:title].blank?
      conditions << 'LOWER("title") LIKE :title'
      values[:title] = "%#{params[:title].to_s.downcase}%"
    end
    query = [conditions.join(' AND '), values] unless values.empty?
    @posts = Post.where(query).order("id DESC").paginate(page: params[:page], per_page: 4)
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