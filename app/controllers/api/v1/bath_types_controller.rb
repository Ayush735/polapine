class Api::V1::BathTypesController < Api::V1::BaseController
  before_action :load_bath_type, only: [:show, :update, :destroy]
  
  def index
    @bath_types = BathTypes.all
    render json: @bath_types 
  end

  def new
    @bath_type = BathType.new
    render json: @bath_type
  end

  def create 
    @bath_type = BathType.new(bath_type_params)
    if @bath_type.save
      render json: {bath_type: @bath_type, status: :created}
    else
      render json: {bath_type: @bath_type, errors: @bath_type.errors.full_messages, status: :unprocessable_entity}
    end  
  end

  def edit
    render json: @bath_type
  end

  def update
    if @bath_type.update(bath_type_params)
      rendewr json: {bath_type: @bath_type , status: :updated}
    else
      render json: {bath_type :@bath_type , errors: @bath_type.errors.full_messages, status: :unproccessable_entity}
     end 
  end

  def show
    render json: @bath_type
  end
  
  def destroy
    if @bath_type.destroy
      render json: {bath_type: @bath_type, status: :deleted}
    else
      render json: {bath_type: @bath_type, errors: @bath_type.errors.full_messages, status: :unproccessable_entity}
    end
  end

  private
  def bath_type_params
    params.require(:bath_type).permit(:name)
  end
  
  def load_bath_type
    @bath_type = BathType.find(params[:id])
  end
end