class ClassNamesController < ApplicationController
  before_action :set_class_name, only: [:show, :edit, :update, :destroy]

  def index
    @class_names = ClassName.all
    @class_relationships = ClassRelationship.all
  end

  def show
  end

  def new
    @class_name = ClassName.new
  end

  def edit
  end

  def create
    @class_name = ClassName.new(class_name_params)

    respond_to do |format|
      if @class_name.save
        format.html { redirect_to @class_name, 
          notice: 'Class name was successfully created.' }
        format.json { render :show, status: :created, location: @class_name }
      else
        format.html { render :new }
        format.json { render json: @class_name.errors, 
          status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @class_name.update(class_name_params)
        format.html { redirect_to @class_name, 
          notice: 'Class name was successfully updated.' }
        format.json { render :show, status: :ok, location: @class_name }
      else
        format.html { render :edit }
        format.json { render json: @class_name.errors, 
          status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @class_name.destroy
    respond_to do |format|
      format.html { redirect_to class_names_url, 
        notice: 'Class name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_class_name
      @class_name = ClassName.find(params[:id])
    end

    def class_name_params
      params.require(:class_name).permit(:name, :group, :attributez, :methodz)
    end
end
