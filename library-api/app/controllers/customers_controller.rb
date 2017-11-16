class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :checkouts]

  def index
    @customers = Customer.all
    json_response(@customers)
  end

  def show
    json_response(@customer)
  end

  def create
    @customer = Customer.create!(customer_params)
    json_response(@customer, :created)
  end

  def update
    @customer.update(customer_params)
    head :no_content
  end

  def checkouts
    if params[:overdue]
    checkouts = @customer.checkouts
    overdue_checkouts = checkouts.to_a.keep_if { |e| e.pickup_date < Time.now - e.product.product_type.checkout_days.days }
    overdue_items = overdue_checkouts.map { |item| item.product }
    json_response(
        {
          overdue_items: overdue_items,
          amount: overdue_checkouts.inject(0) do |sum, item|
            sum + ((Time.now - item.product.product_type.checkout_days.days.ago).to_i / 1.day) * item.product.product_type.late_fee
          end
        }
      )
    else
      json_response({ items: @customer.checkouts })
    end
  end

  private

  def customer_params
    params.permit(
      :name,
      :email,
      :phone,
      :address
    )
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
