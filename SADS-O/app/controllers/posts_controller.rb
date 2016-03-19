class PostsController < ApplicationController
  before_action :set_post, only: [:destroy]

  # Método utilizado como página principal
  # GET /posts
  # GET /posts.json
  def index
    if current_user
      redirect_to user_path
    end
    @posts = Post.all
  end

  # Método utilizado para mostrar una publicacion usando slug (riendly_id) como parametro
  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.friendly.find(params[:id])
    @answers = Answer.where(post_id: @post.id)
  end

  # Método utilizado
  # GET /posts/new
  def new
    @post = Post.new
  end

  # Método utilizado
  # GET /posts/1/edit
  def edit
    @post = Post.friendly.find(params[:id])
  end

  # Método utilizado
  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    if current_user
      @post.user_id = current_user.id
    end
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Tu publicación fue creada con exito.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # Método utilizado
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = Post.friendly.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to show_post_path(@post.slug), notice: 'La publicación fue actualizada.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Se eliminó la publicación.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:post_name, :user_name, :blood_type, :message, :user_id)
    end
end
