class EndsController < ApplicationController
  def new
    @end = End.new
  end
  def create
    End.create(end_params)
  end

  private
  def end_params
    params.require(:end).permit(:attribute_end)
  end 
end
