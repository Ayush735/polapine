class Api::V1::ExpencesController < Api::V1::BaseController
  before_action :load_expence, only: [:show, :update, :destroy]
  
  def index
    @expences = Expences.all
    render json: @expences
  end

  # def new
  #   @expence = Expence.new
  #   render json: @expence
  # end

  def create 
    @expence = Expence.new(expence_params)
    if @expence.save
      render json: {expence: @expence , status: :created}
    else
      render json: {expence: @expence, errors: @expence.errors.full_messages, status: :unprocessable_entity}
    end  
  end

  # def edit
  #   render json: @expence
  # end

  def update
    if @expence.update(expence_params)
      render json: {expence: @expence, status: :updated}
    else
      render json: {expence: @expence , errors: @expence.errors.full_messages, status: :unprocessable_entity}
     end 
  end

  def show
    render json: @expence
  end
  
  def destroy
    if @expence.destroy
      render json:{expence: @expence, status: :deleted}
    else
      render json:{expence: @expence ,errors: @expence.errors.full_messages, status: :unprocessable_entity}
    end
  end

  private
  def expence_params
    params.require(:expence).permit(:name)
  end
  
  def load_expence
    @expence = Expence.find(params[:id])
  end
end