class ErasController < ApplicationController
  before_action :redirect

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
  def redirect
    redirect_to root_path unless current_user.id == 1
  end
end
