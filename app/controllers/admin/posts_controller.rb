class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def show
    @comment = @post.comments.new unless @post.blank?
    @comments = Comment.where(post_id: @post).order("created_at ASC")
  end
end