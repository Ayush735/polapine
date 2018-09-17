class Owner::RoomsController < ApplicationController
  def index
  end

  def new
  end

  def create 
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
  end

  def booked
  end

  private
  def room_params
    params.require(:room).permit(:sqr_ft, :rent, :deposit, :current_status, :no_of_beds,
      :furnishing_type_id, :bath_type_id, :proprty_id, :sharing_type_id, :tenant_type_id)
  end
end