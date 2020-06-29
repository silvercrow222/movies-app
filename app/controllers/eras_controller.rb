class ErasController < ApplicationController
  def new
    @era = Era.new
  end
  def create
    Era.create(era_params)
  end

  private
  def era_params
    params.require(:era).permit(:attribute_era)
  end 
end
