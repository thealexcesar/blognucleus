class HomeController < ApplicationController
  def index
    # @posts = Post.all
  end
  def show
    # @post = Post.find_by_id params[:id]
    # @comment = @post.comments.new unless @post.blank?
    # @comments = Comment.where(post_id: @post).order("created_at ASC")
  end
end