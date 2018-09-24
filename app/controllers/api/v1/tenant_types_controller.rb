class Api::V1::TenantTypesController < Api::V1::BaseController
  before_action :load_tenant_type, only: [:show, :update, :destroy]
  
  def index
    @tenant_types = TenantType.all
    render json: @tenant_types
  end

  def new
    @tenant_type  = TenantType.new
    render json: @tenant_type
  end

  def create 
    @tenant_type  = TenantType.new(tenant_type_params)
    if @tenant_type.save
      render json: {tenant_type: @tenant_type,  status: :created}
    else 
      render json: {tenant_type: @tenant_type, errors: @tenant_type.errors.full_messages, status: :unprocessable_unit}
    end  
  end

  def edit
    render json: @tenant_type
  end

  def update
    @tenant_type.update(tenant_type_params)
    if @tenant_type.save
      render json: {tenant_type: @tenant_type,  status: :updated}
    else 
      render json: {tenant_type: @tenant_type, errors: @tenant_type.errors.full_messages, status: :unprocessable_unit}
    end  
  end
  
  def show
    render json: @tenant_type
  end
  
  def destroy
    if @tenant_type.destroy
      render json: {tenant_type: @tenant_type,  status: :deleted}
    else 
      render json: {tenant_type: @tenant_type, errors: @tenant_type.errors.full_messages, status: :unprocessable_unit}
    end
  end

  private
  def tenant_type_params
    params.require(:tenant_type).permit(:name)
  end
  
  def load_tenant_type
    @tenant_type = TenantType.find(params[:id])
  end

end