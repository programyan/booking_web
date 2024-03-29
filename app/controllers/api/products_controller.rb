# frozen_string_literal: true

class Api::ProductsController < Api::BaseController
  include ActionController::MimeResponds
  before_action :set_product, only: [:show, :edit, :update, :destroy, :visibility_change]
  before_action :authenticate_user!, only: [:update, :visibility_change, :destroy]

  respond_to :json

  # GET /products
  # GET /products.json
  def index
    result, operation = Products::Find.run params
    if result
      render json: operation.to_json
    else
      render json: { errors: operation.contract.errors.messages }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond Products::Update, location: nil
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    respond Products::Delete, location: nil
  end

  def visibility_change
    respond Products::VisibilityChange, location: nil
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:category_id, :company_id, :title, :brief, :description, :photo, :main_options, :additional_info, :active)
    end
end
