class ClassNamesController < ApplicationController
  before_action :set_class_name, only: [:show, :edit, :update, :destroy]

  # GET /class_names
  # GET /class_names.json
  def index
    @class_names = ClassName.all
  end

  # GET /class_names/1
  # GET /class_names/1.json
  def show
  end

  # GET /class_names/new
  def new
    @class_name = ClassName.new
  end

  # GET /class_names/1/edit
  def edit
  end

  # POST /class_names
  # POST /class_names.json
  def create
    @class_name = ClassName.new(class_name_params)

    respond_to do |format|
      if @class_name.save
        format.html { redirect_to @class_name, notice: 'Class name was successfully created.' }
        format.json { render :show, status: :created, location: @class_name }
      else
        format.html { render :new }
        format.json { render json: @class_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_names/1
  # PATCH/PUT /class_names/1.json
  def update
    respond_to do |format|
      if @class_name.update(class_name_params)
        format.html { redirect_to @class_name, notice: 'Class name was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_name }
      else
        format.html { render :edit }
        format.json { render json: @class_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_names/1
  # DELETE /class_names/1.json
  def destroy
    @class_name.destroy
    respond_to do |format|
      format.html { redirect_to class_names_url, notice: 'Class name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_name
      @class_name = ClassName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_name_params
      params.require(:class_name).permit(:name, :group, :attributez, :methodz)
    end
end
