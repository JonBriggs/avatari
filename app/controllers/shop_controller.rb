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
    @possible_items = Item.where("value >= ?", value / 2).where("value <= ?", value * 2)
  end
  
  def open_chest
    value = params[:value].to_f
    @customer = current_user
    @possible_items = Item.where("value >= ?", value / 2).where("value <= ?", value * 2)
    @item_won = @possible_items[rand(@possible_items.size)]
    owned_item = OwnedItem.new
    owned_item.individual = @customer
    owned_item.item = @item_won
    owned_item.wearing = true
    owned_item.save
    redirect_to owned_item
  end
end
