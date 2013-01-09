class ShopController < ApplicationController

  def index
    @target_areas = TargetArea.all
  end

end
