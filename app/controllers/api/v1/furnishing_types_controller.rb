class Api::V1::FurnishingTypesController < Api::V1::BaseController
  before_action :load_furnishing_type, only: [:show, :update, :destroy]
  
  def index
    @furnishing_types = FurnishingType.all
    render json: @furnishing_types 
  end

  # def new
  #   @furnishing_type = FurnishingType.new
  #   render json: @furnishing_type 
  # end

  def create 
    @furnishing_type = FurnishingType.new(furnishing_type_params)
    if @furnishing_type.save
      render json: {furnishing_type: @furnishing_type , status: :created}
    else
      render json: {furnishing_type: @furnishing_type ,errors: @furnishing_type.errors.full_messages ,status: :unprocessable_entity}
    end  
  end

  # def edit
  #   render json: @furnishing_type
  # end

  def update
    if @furnishing_type.update(furnishing_type_params)
      render json: {furnishing_type: @furnishing_type , status: :updated}
    else
      render json: {furnishing_type: @furnishing_type ,errors: @furnishing_type.errors.full_messages , status: :unprocessable_entity}
    end 
  end

  def show
    render json: @furnishing_type
  end
  
  def destroy
    if @furnishing_type.destroy
      render json: {furnishing_type: @furnishing_type , status: :deleted}
    else
     render json: {furnishing_type: @furnishing_type ,errors: @furnishing_type.errors,full_messages, status: :unprocessable_entity }
    end
  end

  private
  def furnishing_type_params
    params.require(:furnishing_type).permit(:name)
  end
  
  def load_furnishing_type
    @furnishing_type = FurnishingType.find(params[:id])
  end
end