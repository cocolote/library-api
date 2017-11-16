class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :checkouts, :new_checkout]

  def index
    if params[:author]
      @products = Product.find_by("author like ?", "%#{params[:author]}%")
    elsif params[:title]
      @products = Product.find_by("name like ?", "%#{params[:title]}%")
    else
      @products = Product.all
    end
    json_response(@products)
  end

  def show
    json_response(@product)
  end

  def create
    @product = Product.create!(product_params)
    json_response(@product, :created)
  end

  def update
    @product.update(product_params)
    header :no_content
  end

  def checkouts
    json_response(@product.checkouts)
  end

  def new_checkout
    if @product.in_library
      @product.in_library = false
      @product.save

      Checkout.create!(
        customer: Customer.find(params[:customer_id]),
        product: @product,
        pickup_date: Time.now
      )

      json_response({ message: "The pruduct #{@product.id} has been checkout"})
    else
      json_response({ message: "The product #{@product.id} is not available" }, :not_found)
    end
  end

  private

  def product_params
    params.permit(
      :name,
      :author,
      :publisher,
      :genre,
      :publisher_date,
      :description,
      :in_library,
      :product_type
    ) 
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
