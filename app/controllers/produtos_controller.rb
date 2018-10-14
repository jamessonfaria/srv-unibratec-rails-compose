class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :update, :destroy]

  # GET /produtos
  def index
    @produtos = Produto.all

    render json: @produtos
  end

  # GET /produtos/1
  def show
    render json: @produto
  end

  # POST /produtos
  def create
    @produto = Produto.new(produto_params)

    if @produto.save
      render json: @produto, status: :created, location: @produto
    else
      render json: @produto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /produtos/1
  def update
    if @produto.update(produto_params)
      render json: @produto
    else
      render json: @produto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /produtos/1
  def destroy
    @produto.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def produto_params
      params.require(:produto).permit(:id, :name, :price, :stock)
    end
end
