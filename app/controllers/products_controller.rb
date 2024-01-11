class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all
    render :index
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def create
    # if current_user.admin
      @product = Product.new(
          name: params[:name],
          price: params[:price],
          description: params[:description],
    )
    if @product.save #happy path
      render json: { message: "Your product was saved." }
      # render :show
    else #sad path
      render json: { errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id])

    @product.update(
      name: params["name"] || @product.name,
      price: params["price"] || @product.price,
      description: params["description"] || @product.description,
    )
    if @product.save #happy path
      render :show
    else #sad path
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: { message: "The product was deleted." }
  end
end
