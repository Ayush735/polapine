class Api::V1::PropertiesController < Api::V1::BaseController
  before_action :load_property, only: [:show, :update, :destroy]
  
  def index
    @properties = Property.all
    render json: @properties
  end

  def new
    @property = Property.new
    render json: @property
  end

  def create 
    @property = Property.new(property_params)
    if @property.save
      render json: {property: @property, status: :created}
    else
      render json: {property: @property, errors: @property.errors.full_messages, status: :unprocessable_entity}
    end  
  end

  def edit
    render json: @property
  end

  def update
    if @property.update(property_params)
      render json:{property: @property, status: :updated}
    else
      render json:{property: @property, errors: @property.errors.full_messages, status: :unprocessable_entity}
     end 
  end

  def show
    render json: @property
  end
  
  def destroy
    if @property.destroy
      render json:{property: @property, status: :deleted}
    else
      render json:{property: @property, errors: @property.errors.full_messages, status: :unproces/////sable_entity}
  end

  private
  def property_params
    params.require(:property).permit(:name,:property_type_id)
  end
  
  def load_property
    @property = Property.find(params[:id])
  end
end