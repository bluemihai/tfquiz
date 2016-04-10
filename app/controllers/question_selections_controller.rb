class QuestionSelectionsController < ApplicationController
  before_action :set_question_selection, only: [:show, :edit, :update, :destroy]

  # GET /question_selections
  # GET /question_selections.json
  def index
    @question_selections = QuestionSelection.all
  end

  # GET /question_selections/1
  # GET /question_selections/1.json
  def show
  end

  # GET /question_selections/new
  def new
    @question_selection = QuestionSelection.new
  end

  # GET /question_selections/1/edit
  def edit
  end

  # POST /question_selections
  # POST /question_selections.json
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

  # PATCH/PUT /question_selections/1
  # PATCH/PUT /question_selections/1.json
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

  # DELETE /question_selections/1
  # DELETE /question_selections/1.json
  def destroy
    @question_selection.destroy
    respond_to do |format|
      format.html { redirect_to question_selections_url, notice: 'Question selection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_selection
      @question_selection = QuestionSelection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_selection_params
      params.require(:question_selection).permit(:question_id, :quiz_id, :display_t_or_f)
    end
end
