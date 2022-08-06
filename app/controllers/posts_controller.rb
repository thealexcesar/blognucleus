class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :create_comment, :destroy ]

  # ====================================================================================================================
  def index
    @posts = Post.all
  end
  # ====================================================================================================================
  def show
    @comment = @post.comments.new unless @post.blank?
    puts "comment_teste#{@post.comments.new.inspect}"
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
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
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
      @texto = "Comentario criado com sucesso"
    end
    respond_to do |f|
      f.html { redirect_to "/", notice: @texto }
      f.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end
  # ====================================================================================================================
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
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
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  # ====================================================================================================================
  # = PRIVATE ==========================================================================================================
  # ====================================================================================================================
  private
    def set_post
      @post = Post.find_by_id params[:id]
    end
    def post_params
      params.require(:post).permit(:title, :body, :name)
    end
    def comment_params
      params.require(:comment).permit(:name, :body, :post_id)
    end
end
