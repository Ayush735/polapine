class Tenant::RoomsController < ApplicationController
  
  def index
  end

  def show
  end
  
  private
  def room_params
    params.require(:room).permit()
  end
end