class Api::V1::AmenitiesController < Api::V1::BaseController
  before_action :load_property_type, only: [:show, :update, :destroy]
  
  def index
    @property_types = PropertyType.all
    render json: @property_types
  end

  def new
    @property_type = PropertyType.new
    render json: @property_type
  end

  def create 
    @property_type = PropertyType.new(property_type_params)
    if @property_type.save
      render json: {property_type: @property_type, status: :created}
    else
      render json: {property_type: @property_type, errors: @property_type.errors.full_messages, status: :unprocessable_entity}
    end  
  end

  def edit
  end

  def update
    if @property_type.update(property_type_params)
      render json: {property_type: @property_type, status: :updated}
    else
      render json: {property_type: @property_type, errors: @property_type.errors.full_messages, status: :unprocessable_entity}
     end 
  end

  def show
  end
  
  def destroy
    if @property_type.destroy
      render json:{property_type: @property_type, status: :deleted}
    else
      render json:{property_type: @property_type, errors: @property_type.errors.full_messages, status: :unprocessable_entity}
    end
  end

  private
  def property_type_params
    params.require(:property_type).permit(:name)
  end
  
  def load_property_type
    @property_type = PropertyType.find(params[:id])
  end
end