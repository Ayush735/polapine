class Api::V1::SharingTypesController < Api::V1::BaseController
  before_action :load_sharing_type, only: [:show, :update, :destroy]
  
  def index
    @sharing_types  = SharingType.all
    render json: @sharing_types
  end

  # def new
  #   @sharing_type  = SharingType.new
  #   render json: @sharing_type 
  # end

  def create 
    @sharing_type  = SharingType.new(sharing_type_params)
    if @sharing_type.save
      render json:{sharing_type: @sharing_type , status: :created}  
    else
      render json:{sharing_type: @sharing_type , errors: @sharing_type.errors.full_messages, status: :unprocessable_entity}
    end  
  end

  # def edit
  #   rendr json: @sharing_type
  # end

  def update
    @sharing_type.update(sharing_type_params)
    if @sharing_type.save
      render json: {sharing_type: @sharing_type , status: :updated}  
    else
      render json: {sharing_type: @sharing_type , errors: @sharing_type.errors.full_messages, status: :unprocessable_entity}
    end 
  end

  def show
    rendr json: @sharing_type
  end
  
  def destroy
    if @sharing_type.destroy
      render json: {sharing_type: @sharing_type , status: :deleted}  
    else
      render json: {sharing_type: @sharing_type , errors: @sharing_type.errors.full_messages, status: :unprocessable_entity}
    end  
  end

  private
  def sharing_type_params
    params.require(:property_type).permit(:name)
  end
  
  def load_sharing_type
    @sharing_type = PropertyType.find(params[:id])
  end
end