class Admin::RoomsController < ApplicationController
  
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create 
    @room = Room.new(room_params)
  end

  def edit
  end

  def update
  end

  def show
  end
  
  def destroy
  end

  def open
    @room = Room.find(params[:room_id])
    @room.update(current_status: "open")
  end

  def booked
    @room = Room.find(params[:room_id])
    @room.update(current_status: "booked")
  end

  private
  def room_params
    params.require(:room).permit(:sqr_ft, :rent, :deposit, :current_status, :no_of_beds,
      :furnishing_type_id, :bath_type_id, :proprty_id, :sharing_type_id, :tenant_type_id)
  end
end