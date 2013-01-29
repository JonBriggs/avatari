class ShopController < ApplicationController

  def index
    @target_areas = TargetArea.all
    @customer = current_user
  end
  
  def spray_booth
    
  end
  
  def chest
    value = params[:value].to_f
    @customer = current_user
    @possible_items = possible_items_in_chest(value)
  end
  
  def open_chest
    value = params[:value].to_f
    @customer = current_user
    @possible_items = possible_items_in_chest(value)
    @item_won = @possible_items[rand(@possible_items.size)]
    if @customer.account.balance >= value
      owned_item = OwnedItem.new
      owned_item.individual = @customer
      owned_item.item = @item_won
      owned_item.wearing = true
      owned_item.save
      trans = Transaction.new
      trans.account = @customer.account
      trans.remove_funds = value
      trans.notes = "Opened chest for " + value.to_s + " and received " + owned_item.item.name
      trans.stats = "wagered:#{value}\nreceived_item_id\n#{owned_item.item.id}"
      trans.save
      redirect_to owned_item
    else
      flash[:notice] = "You don't have enough to open that chest, earn some more runes and come back later."
      redirect_to @customer
    end
  end
  
  private
  def possible_items_in_chest(value)
    Item.where("value >= ?", value - value / 2).where("value <= ?", value + value / 2)
  end
end
