class TargetAreasController < ApplicationController
  # GET /target_areas
  # GET /target_areas.json
  def index
    @target_areas = TargetArea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @target_areas }
    end
  end

  # GET /target_areas/1
  # GET /target_areas/1.json
  def show
    @target_area = TargetArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @target_area }
    end
  end

  # GET /target_areas/new
  # GET /target_areas/new.json
  def new
    @target_area = TargetArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @target_area }
    end
  end

  # GET /target_areas/1/edit
  def edit
    @target_area = TargetArea.find(params[:id])
  end

  # POST /target_areas
  # POST /target_areas.json
  def create
    @target_area = TargetArea.new(params[:target_area])

    respond_to do |format|
      if @target_area.save
        format.html { redirect_to @target_area, notice: 'Target area was successfully created.' }
        format.json { render json: @target_area, status: :created, location: @target_area }
      else
        format.html { render action: "new" }
        format.json { render json: @target_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /target_areas/1
  # PUT /target_areas/1.json
  def update
    @target_area = TargetArea.find(params[:id])

    respond_to do |format|
      if @target_area.update_attributes(params[:target_area])
        format.html { redirect_to @target_area, notice: 'Target area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @target_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /target_areas/1
  # DELETE /target_areas/1.json
  def destroy
    @target_area = TargetArea.find(params[:id])
    @target_area.destroy

    respond_to do |format|
      format.html { redirect_to target_areas_url }
      format.json { head :no_content }
    end
  end
end
