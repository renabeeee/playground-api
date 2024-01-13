class CartedProductsController < ApplicationController

  def create
    @carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
    )
      render :show
  end

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render :index
  end

  def update_quantity
    carted_product = current_user.carted_products.find_by(id: params[:id], status: "carted")

    if carted_product
      new_quantity = params[:quantity].to_i

      if new_quantity > 0  # Ensure quantity remains positive
        carted_product.update(quantity: new_quantity)
        render json: { message: "Product quantity updated successfully" }
      else
        carted_product.destroy  # Remove if quantity reaches 0
        render json: { message: "Product removed from cart" }
      end
      else
        render json: { message: "Product not found in cart" }, status: :not_found
    end
  end
end
