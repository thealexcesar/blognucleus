class HomeController < ApplicationController
  def index
    @posts = Post.all
    published = Post.where(status: :published).order('created_at DESC')
    @last_post = published.nil? ? "" : published.last
  end
  # def show
    # @post = Post.find_by_id params[:id]
    # @comment = @post.comments.new unless @post.blank?
    # @comments = Comment.where(post_id: @post).order("created_at ASC")
  # end
end