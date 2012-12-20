class IndividualsController < ApplicationController
  # GET /individuals
  # GET /individuals.json
  def index
    @individuals = Individual.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @individuals }
    end
  end

  # GET /individuals/1
  # GET /individuals/1.json
  def show
    @individual = Individual.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @individual }
    end
  end

  # GET /individuals/new
  # GET /individuals/new.json
  def new
    @individual = Individual.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @individual }
    end
  end

  # GET /individuals/1/edit
  def edit
    @individual = Individual.find(params[:id])
  end

  # POST /individuals
  # POST /individuals.json
  def create
    @individual = Individual.new(params[:individual])

    respond_to do |format|
      if @individual.save
        format.html { redirect_to @individual, notice: 'Individual was successfully created.' }
        format.json { render json: @individual, status: :created, location: @individual }
      else
        format.html { render action: "new" }
        format.json { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /individuals/1
  # PUT /individuals/1.json
  def update
    @individual = Individual.find(params[:id])

    respond_to do |format|
      if @individual.update_attributes(params[:individual])
        format.html { redirect_to @individual, notice: 'Individual was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /individuals/1
  # DELETE /individuals/1.json
  def destroy
    @individual = Individual.find(params[:id])
    @individual.destroy

    respond_to do |format|
      format.html { redirect_to individuals_url }
      format.json { head :no_content }
    end
  end
end
