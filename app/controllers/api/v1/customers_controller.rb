module Api
  module V1
    class CustomersController < ApplicationController
      def index
        customers = Customer.all
        render json: { status: 200, message: "Loaded customers", data: customers }
      end

      def create
        customer = Customer.new(customer_params)
        if customer.save
          render json: { status: 200, data: customer }
        else
          render json: { status: 400, data: customer.errors }
        end
      end

      def customer_params
        params.require(:customer).permit(:firstName, :lastName, :age, :address, :memo, :tags)
      end
    end
  end
end
