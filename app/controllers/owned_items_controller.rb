class OwnedItemsController < ApplicationController
  # GET /owned_items
  # GET /owned_items.json
  def index
    @owned_items = OwnedItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @owned_items }
    end
  end

  # GET /owned_items/1
  # GET /owned_items/1.json
  def show
    @owned_item = OwnedItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @owned_item }
    end
  end

  # GET /owned_items/new
  # GET /owned_items/new.json
  def new
    @owned_item = OwnedItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @owned_item }
    end
  end

  # GET /owned_items/1/edit
  def edit
    @customer = current_user
    @owned_item = OwnedItem.find(params[:id])
  end

  # POST /owned_items
  # POST /owned_items.json
  def create
    @owned_item = OwnedItem.new(params[:owned_item])

    respond_to do |format|
      if @owned_item.save
        format.html { redirect_to @owned_item, notice: 'Owned item was successfully created.' }
        format.json { render json: @owned_item, status: :created, location: @owned_item }
      else
        format.html { render action: "new" }
        format.json { render json: @owned_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /owned_items/1
  # PUT /owned_items/1.json
  def update
    @owned_item = OwnedItem.find(params[:id])

    respond_to do |format|
      if @owned_item.update_attributes(params[:owned_item])
        format.html { redirect_to @owned_item.individual, notice: 'Owned item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @owned_item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def sellback
    @customer = current_user
    @owned_item = OwnedItem.find(params[:owned_item_id])
    trans = Transaction.new
    trans.add_funds = @owned_item.item.resale_value
    trans.account = @customer.account
    trans.notes = "Customer sold back " + @owned_item.item.name + " for " + @owned_item.item.resale_value.to_s
    trans.stats = @customer.firstname + "," + @customer.lastname + ",Sellback," + @owned_item.item_id.to_s + "," + @owned_item.item.resale_value.to_s
    trans.save
    @owned_item.destroy
    redirect_to @customer
  end

  # DELETE /owned_items/1
  # DELETE /owned_items/1.json
  def destroy
    @owned_item = OwnedItem.find(params[:id])
    @owned_item.destroy

    respond_to do |format|
      format.html { redirect_to owned_items_url }
      format.json { head :no_content }
    end
  end
end
