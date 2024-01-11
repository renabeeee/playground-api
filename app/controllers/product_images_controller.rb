class ProductImagesController < ApplicationController

  def create
      product = Product.find(params[:product_id])
      image = product.product_images.new(
        url: params[:url],
      )

      if image.save
        render json: { message: "Image uploaded successfully"}

      else
      render json: { errors: product_image.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @product_image = ProductImage.find(params[:id])

    @product_image.update(
      url: params[:url] || @product_image.url,
    )
    if @product_image.save #happy path
      render json: { message: "Done" }
    else #sad path
      render json: { errors: @product_image.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product_image = ProductImage.find(params[:id])
    @product_image.destroy
    render json: { message: "The product image was deleted." }
  end
end
