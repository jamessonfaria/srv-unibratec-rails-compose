class CategoriaController < ApplicationController
  before_action :set_categorium, only: [:show, :update, :destroy]

  # GET /categoria
  def index
    @categoria = Categorium.all

    render json: @categoria
  end

  # GET /categoria/1
  def show
    render json: @categorium
  end

  # POST /categoria
  def create
    @categorium = Categorium.new(categorium_params)

    if @categorium.save
      render json: @categorium, status: :created, location: @categorium
    else
      render json: @categorium.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categoria/1
  def update
    if @categorium.update(categorium_params)
      render json: @categorium
    else
      render json: @categorium.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categoria/1
  def destroy
    @categorium.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categorium
      @categorium = Categorium.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def categorium_params
      params.require(:categorium).permit(:descricao)
    end
end
