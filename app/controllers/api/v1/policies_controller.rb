class Api::V1::PoliciesController < Api::V1::BaseController
  before_action :load_policy, only: [:show, :update, :destroy]
  
  def index
    @policies = Policy.all
    render json: @policies
  end

  # def new
  #   @policy = Policy.new
  #   render json: @policy
  # end

  def create 
    @policy = Policy.new(policy_params)
    if @policy.save
      render json: {policy: @policy , status: :created}
    else
      render json: {policy: @policy , errors: @policy.errors.full_messages , status: :unprocessable_entity}
    end  
  end

  # def edit
  #   render json: @policy
  # end

  def update
    if @policy.update(policy_params)
      render json:{policy: @policy, status: :updated}
    else
      render json:{policy: @policy, errors: @policy.errors.full_messages,status: :unprocessable_entity}
     end 
  end

  def show
    render json: @policy
  end
  
  def destroy
    if @policy.destroy
      render json:{policy: @policy , status: :deleted}
    else
      render json:{policy: @policy ,errors: @policy.errors.full_messages , status: :unprocessable_entity}
    end
  end

  private
  def policy_params
    params.require(:policy).permit(:title, :description)
  end
  
  def load_policy
    @policy = Policy.find(params[:id])
  end
end