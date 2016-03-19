class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # Metodo utilizado para una respuesta especifica
  # GET /answers/1
  # GET /answers/1.json
  def show
    @answer = Answer.find(params[:answer_id])
  end

  # Método utilizado para crear respuesta de un post con url compuesta
  # GET /answers/new
  def new
    @post = Post.friendly.find(params[:id])
    @answer = Answer.new
    @answer.post_id = @post.id
  end

  # Método utilizado
  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @post = Post.friendly.find(answer_params[:post_id])
    @answer = Answer.new(answer_params)
    respond_to do |format|
      if @answer.save
        # Redireccionamos a la publicación como indicamos en el diagrama de navegación
        format.html { redirect_to post_path(Post.find(answer_params[:post_id]).slug),
                   notice: 'Respuesta Creada correctamente.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # Método utilizado
  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        # Redireccionamos a la publicación como indicamos en el diagrama de navegación
        format.html { redirect_to show_post_path(Post.find(answer_params[:post_id]).slug),
                   notice: 'Respuesta Actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:user_name, :blood_group, :post_id, :email, :phone, :cellphone, :message)
    end
end
