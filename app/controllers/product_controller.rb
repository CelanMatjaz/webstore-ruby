class ProductController < ApplicationController
  def show
    @product = Product.find_by(id: product_params[:id])
 
    return if @product

    render 'layouts/http_error', locals: { error: { code: 404, message: 'Product does not exist.' } }
  end

  private

  def product_params
    params.permit(:id)
  end
end
