class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :update, :destroy, :destroy_comment  ], except: :index
  before_action :require_user, :admin?, only: [ :update, :destroy, :destroy_comment  ], except: :index
  before_action :set_post, only: [ :author_posts, :show, :edit, :update, :create_comment, :destroy, :destroy_comment ]
  before_action :set_comment, only: [ :show, :create_comment ]

  # ====================================================================================================================
  def index
    query = Post.filter params
    @posts = Post.where(query).where(status: :published).order("created_at DESC").paginate(page: params[:page], per_page: 5)
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
  def culture
    @culture = Post.where(category: "Cultura").order("created_at DESC").paginate(page: params[:page], per_page: 3)
  end
  # ====================================================================================================================
  def graphic
    @graphic = Post.where(category: "Gráfica").order("created_at DESC").paginate(page: params[:page], per_page: 3)
  end
  # ====================================================================================================================
  def financial
    @financial = Post.where(category: "Financeiro").order("created_at DESC").paginate(page: params[:page], per_page: 3)
  end
  # ====================================================================================================================
  def technology
    @technology = Post.where(category: "Tecnologia").order("created_at DESC").paginate(page: params[:page], per_page: 3)
  end
  # ====================================================================================================================
  def author_posts
    @user = @post.user
    @posts = @user.posts.order("created_at DESC").paginate(page: params[:page], per_page: 5)
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
      format.html { redirect_to admin_posts_url, notice: Translate.destroyed_msg(controller_name.classify) }
      format.json { head :no_content }
    end
  end

  # ====================================================================================================================
  # COMMENT ============================================================================================================
  # ====================================================================================================================
  def create_comment
    @post = Post.find_by_id params[:comment][:post_id]
    @comment = @post.comments.new(comment_params)
    @texto = I18n.t('comment.error.creating')

    if @comment.save
      @texto = I18n.t('comment.successfully.created')
    end
    respond_to do |f|
      f.html { redirect_to post_url(@post), notice: @texto }
      f.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end
  # ====================================================================================================================
  def destroy_comment
    # @post = Post.find_by_id params[:comment][:post_id]
    @comment = Comment.find_by_id params[:id]

    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: I18n.t('comment.successfully.destroyed') }
      format.json { head :no_content }
    end
  end
  # FIM COMMENT ========================================================================================================

  # ====================================================================================================================
  # PRIVATE ============================================================================================================
  # ====================================================================================================================
  private
  def set_post
    @post = Post.find_by_id params[:id]
  end
  def set_comment
    @comment = Comment.find_by_id params[:post_id]
  end
  def post_params
    params.require(:post).permit(:title, :body, :user_id, :status)
  end
  def comment_params
    params.require(:comment).permit(:name, :body, :post_id)
  end
end
