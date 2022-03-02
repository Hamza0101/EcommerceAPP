class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]
  before_action :set_owned_product, only: %i[edit update destroy]

  def index
    @products = Product.order(updated_at: :desc)
  end

  def create
    @product = current_user.products.create(product_params)
    redirect_to products_path, notice: 'Product was successfully created.' if @product.save!
  end

  def new
    @product = current_user.products.new
  end

  def show; end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: 'Product was successfully Updated.'
    end
  end

  def destroy
    redirect_to products_path, notice: 'Product was successfully deleted.' if @product.destroy
  end

  private

  def set_owned_product
    @product = current_user.products.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:serial_no, :attached_image, :title, :description)
  end
end
