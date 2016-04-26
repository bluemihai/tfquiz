class ClassRelationshipsController < ApplicationController
  before_action :set_class_relationship, only: [:show, :edit, :update, :destroy]

  def index
    @class_names = ClassName.all
  end

  def show
  end

  def new
    @class_relationship = ClassRelationship.new
  end

  def edit
  end

  def create
    @class_relationship = ClassRelationship.new(class_relationship_params)

    respond_to do |format|
      if @class_relationship.save
        format.html { redirect_to @class_relationship,
          notice: 'Class relationship was successfully created.' }
        format.json { render :show,
          status: :created, location: @class_relationship }
      else
        format.html { render :new }
        format.json { render json: @class_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @class_relationship.update(class_relationship_params)
        format.html { redirect_to :back,
          notice: 'Class relationship was successfully updated.'}
        format.json { render :show, status: :ok, location: @class_relationship }
      else
        format.html { render :edit }
        format.json { render json: @class_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @class_relationship.destroy
    respond_to do |format|
      format.html { redirect_to class_relationships_url,
        notice: 'Class relationship successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_class_relationship
      @class_relationship = ClassRelationship.find(params[:id])
    end

    def class_relationship_params
      params.require(:class_relationship).permit(
        :primary_id,
        :secondary_id,
        :class_rel,
        :object_rel)
    end
end
