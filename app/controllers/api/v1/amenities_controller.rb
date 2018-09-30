class Api::V1::AmenitiesController < Api::V1::BaseController
  before_action :load_amenity, only: [:show, :update ,:destroy]
  
  def index
    @amenities = Amenities.all
    render json: @amenities
  end

  # def new
  #   @amenity = Amenity.new
  #   render json: @amenity
  # end

  def create 
    @amenity = Amenity.new(amenity_params)
    if @amenity.save
      render json: {amenity: @amenity, status: :created}
    else
      render json: {amenity: @amenity, errors: @amenity.errors.full_messages, status: :unprocessable_entity}
    end
  end

  # def edit
  #   render json: @amenity
  # end

  def update
    if @amenity.update(amenity_params)
      render json: {amenity: @amenity, status: :updated}
    else
      render json: {amenity: @amenity, errors: @amenity.errors.full_messages ,status: :unprocessable_entity}
    end
  end

  def show
    render json: @amenity.to_json
  end
  
  def destroy
    if @amenity.destroy
      render json: {amenity: @amenity, status: :deleted}
    else
      render json: {amenity: @amenity, errors: @amenity.errors.full_messages, status: :unprocessable_entity}
    end
  end

  private
  def amenity_params
    params.require(:amenity).permit(:name)
  end
  
  def load_amenity
    @amenity = Amenity.find(params[:id])
  end
end