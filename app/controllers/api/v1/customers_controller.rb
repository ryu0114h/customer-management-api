module Api
  module V1
    class CustomersController < ApplicationController
      def index
        customers = Customer.all
        render json: { status: 200, message: "Loaded customers", data: customers }
      end
    end
  end
end
