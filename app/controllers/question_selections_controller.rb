class QuestionSelectionsController < ApplicationController
  before_action :set_question_selection, only: [:show, :edit, :update, :destroy]

  def index
    @question_selections = QuestionSelection.all
  end

  def show
  end

  def new
    @question_selection = QuestionSelection.new
  end

  def edit
  end

  def create
    @question_selection = QuestionSelection.new(question_selection_params)

    respond_to do |format|
      if @question_selection.save
        format.html { redirect_to @question_selection, notice: 'Question selection was successfully created.' }
        format.json { render :show, status: :created, location: @question_selection }
      else
        format.html { render :new }
        format.json { render json: @question_selection.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question_selection.update(question_selection_params)
        format.html { redirect_to @question_selection, notice: 'Question selection was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_selection }
      else
        format.html { render :edit }
        format.json { render json: @question_selection.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question_selection.destroy
    respond_to do |format|
      format.html { redirect_to question_selections_url, notice: 'Question selection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_question_selection
      @question_selection = QuestionSelection.find(params[:id])
    end

    def question_selection_params
      params.require(:question_selection).permit(
        :question_id,
        :quiz_id,
        :display_t_or_f,
        :current_answer
      )
    end
end
