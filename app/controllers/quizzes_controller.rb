class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  def index
    @quiz = Quiz.new
    if current_user && current_user.quizzes.first
      @quizzes = current_user.quizzes
    else
      @quizzes = Quiz.where(user_id: nil)
    end
  end

  def show
  end

  def new
    @quiz = Quiz.new
  end

  def edit
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.regenerate_questions unless params[:skip_regenerate_questions]
    @quiz.randomize_tf unless params[:skip_randomize_tf]
    respond_to do |format|
      if @quiz.save
        format.html { redirect_to quizzes_url, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @quiz.regenerate_questions unless params[:skip_regenerate_questions]
    @quiz.randomize_tf unless params[:skip_randomize_tf]
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to quizzes_url, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    def quiz_params
      params.require(:quiz).permit(:name, :user_id, :custom, :question_count, tag_ids: [])
    end
end
