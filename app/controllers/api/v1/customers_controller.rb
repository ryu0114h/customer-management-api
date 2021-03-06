module Api
  module V1
    class CustomersController < ApplicationController
      before_action :authenticate_api_v1_user!

      def index
        # 全部表示
        customers = Customer.all
        # ユーザー毎に表示
        # customers = Customer.where(user_id: current_api_v1_user.id)

        render json: { status: 200, message: "Loaded customers", data: customers }
      end

      def create
        params = customer_params
        params[:user_id] = current_api_v1_user.id
        customer = Customer.new(params)
        if customer.save
          render json: { status: 200, data: customer }
        else
          render json: { status: 400, data: customer.errors }
        end
      end

      def destroy
        if customer = Customer.find_by(id: params[:id])
          customer.destroy
          render json: { status: 200, message: "Deleted the customer", data: customer }
        else
          render json: { status: 400, data: customer.errors }
        end
      end

      def update
        if customer = Customer.find_by(id: params[:id])
          customer.update(customer_params)
          render json: { status: 200, message: "update the customer", data: customer }
        else
          render json: { status: 400, data: customer.errors }
        end
      end

      def customer_params
        params.require(:customer).permit(:id, :firstName, :lastName, :age, :address, :memo, :user_id, :created_at, :updated_at, :tags)
      end
    end
  end
end
