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
end
