class ClassRelationshipsController < ApplicationController
  before_action :set_class_relationship, only: [:show, :edit, :update, :destroy]

  # GET /class_relationships
  # GET /class_relationships.json
  def index
    @class_relationships = ClassRelationship.all
  end

  # GET /class_relationships/1
  # GET /class_relationships/1.json
  def show
  end

  # GET /class_relationships/new
  def new
    @class_relationship = ClassRelationship.new
  end

  # GET /class_relationships/1/edit
  def edit
  end

  # POST /class_relationships
  # POST /class_relationships.json
  def create
    @class_relationship = ClassRelationship.new(class_relationship_params)

    respond_to do |format|
      if @class_relationship.save
        format.html { redirect_to @class_relationship, notice: 'Class relationship was successfully created.' }
        format.json { render :show, status: :created, location: @class_relationship }
      else
        format.html { render :new }
        format.json { render json: @class_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /class_relationships/1
  # PATCH/PUT /class_relationships/1.json
  def update
    respond_to do |format|
      if @class_relationship.update(class_relationship_params)
        format.html { redirect_to @class_relationship, notice: 'Class relationship was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_relationship }
      else
        format.html { render :edit }
        format.json { render json: @class_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_relationships/1
  # DELETE /class_relationships/1.json
  def destroy
    @class_relationship.destroy
    respond_to do |format|
      format.html { redirect_to class_relationships_url, notice: 'Class relationship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_relationship
      @class_relationship = ClassRelationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_relationship_params
      params.require(:class_relationship).permit(:primary_id, :secondary_id, :class_rel, :object_rel)
    end
end
