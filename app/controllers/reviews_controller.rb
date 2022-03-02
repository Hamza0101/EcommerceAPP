class ReviewsController < ApplicationController
  before_action :set_current, only: %i[show update edit destroy create]
  before_action :set_review, only: %i[update edit destroy]

  def index; end

  def new
    @review = current_user.product.reviews.new
  end

  def create
    @product.reviews.create(review_params.merge(author_name: current_user.email,
                                                user_id: current_user.id))

    redirect_to product_path(@product)
  end

  def update; end

  def destroy; end

  def show; end

  private

  def set_current
    @product = Product.find(params[:product_id])
    if @product.user_id == current_user.id
      redirect_to product_path(@product), notice: 'Please dont try to add fake reviews'
    end
  end

  def set_review
    @review = @product.reviews.find(params[:review_id])
    if @review.user_id == current_user.id
      redirect_to product_path(@product), notice: 'You are not authorize'
    end
  end

  def review_params
    params.require(:product).permit(:body)
  end
end
