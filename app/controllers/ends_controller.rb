class EndsController < ApplicationController
  before_action :redirect

  def new
    @end = End.new
  end
  def create
    redirect_to action: :new if End.create(end_params)
  end

  private
  def end_params
    params.require(:end).permit(:attribute_end)
  end 
  def redirect
    redirect_to root_path unless current_user.id == 1
  end
end
