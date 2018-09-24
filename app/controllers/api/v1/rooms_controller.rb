class Api::V1::RoomsController < Api::V1::BaseController
  before_action :load_room, only: [:show, :update, :destroy, :set_status_open, :set_status_booked]
  
  def index
    @rooms = Room.all
    render json: @rooms 
  end

  def new
    @room = Room.new
    render json: @room
  end

  def create 
    @room = Room.new(room_params)
    if @room.save
      render json:{room: @room, status: :created}
    else
      render json:{room:@room, errors: @room.errors.full_messages,status: :unprocessable_entity}
    end  
  end

  def edit
    render json: @room
  end

  def update
    @room = @room.update(room_params)
    if @room.save
      render json:{room: @room, status: :updated}
    else
      render json:{room:@room, errors: @room.errors.full_messages,status: :unprocessable_entity}
    end
  end

  def show
    render json: @room
  end
  
  def destroy
    if @room.destroy
      render json:{room: @room, status: :deleted}
    else
      render json:{room:@room, errors: @room.errors.full_messages, status: :unprocessable_entity}
    end  
  end

  def set_status_open
    @room.update(current_status: "open")
    if @room.save
      render json: {room: @room, status: :ok}
    else
      render json: {room: @room , errors: @room.errors.full_messages, status: :unprocessable_entity}
    end
  end

  def set_status_booked
    @room.update(current_status: "booked")
    if @room.save
      render json: {room: @room, status: :ok}
    else
      render json: {room: @room , errors: @room.errors.full_messages, status: :unprocessable_entity}
    end
  end

  private
  def room_params
    params.require(:room).permit(:sqr_ft, :rent, :deposit, :current_status, :no_of_beds,
      :furnishing_type_id, :bath_type_id, :proprty_id, :sharing_type_id, :tenant_type_id,
       address_attributes: [:id, :address_line_1, :address_line_2, :nearest_landmark, :colony,:city, :state, :pin ,:_destroy ])
  end
  def load_room
    @room = Room.find(params[:id])
  end
end