class PostsController < ApplicationController
  before_action :set_post_comments, only: [ :show, :edit, :update, :create_comment, :destroy, :show, :create_comment ]

  # ====================================================================================================================
  def index
    @posts = Post.all.order("id DESC")

  end
  # ====================================================================================================================
  def show
    @comment = @post.comments.new unless @post.blank?
    @comments = Comment.where(post_id: @post).order("created_at ASC")
  end
  # ====================================================================================================================
  def new
    @post = Post.new
  end
  # ====================================================================================================================
  def edit
  end
  # ====================================================================================================================
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: Translate.created_msg(controller_name.classify) }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  # ====================================================================================================================
  def create_comment
    @post = Post.find_by_id params[:comment][:post_id]
    @comment = @post.comments.new(comment_params)

    if @comment.save
      @texto = I18n.t('comment.successfully.created')
    end
    respond_to do |f|
      f.html { redirect_to post_url(@post), notice: @texto }
      f.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end
  # ====================================================================================================================
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: Translate.updated_msg(controller_name.classify) }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  # ====================================================================================================================
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: Translate.destroyed_msg(controller_name.classify) }
      format.json { head :no_content }
    end
  end
  # ====================================================================================================================
  # = PRIVATE ==========================================================================================================
  # ====================================================================================================================
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_comments
      @post = Post.find_by_id params[:id]
      @comment = Comment.find_by_id params[:post_id]
    end
    def post_params
      params.require(:post).permit(:title, :body, :user_id, :status)
    end
    def comment_params
      params.require(:comment).permit(:name, :body, :post_id)
    end
end
