module Api
  module V1
    class UsersController < ApplicationController
      # before_action :authenticate_api_v1_staff!

      def index
        # 全部表示
        users = User.all
        # ユーザー毎に表示
        # users = User.where(staff_id: current_api_v1_staff.id)

        render json: { status: 200, message: "Loaded users", data: users }
      end

      def create
        params = user_params
        params[:staff_id] = current_api_v1_staff.id
        user = User.new(params)
        if user.save
          render json: { status: 200, data: user }
        else
          render json: { status: 400, data: user.errors }
        end
      end

      def destroy
        if user = User.find_by(id: params[:id])
          user.destroy
          render json: { status: 200, message: "Deleted the user", data: user }
        else
          render json: { status: 400, data: user.errors }
        end
      end

      def update
        if user = User.find_by(id: params[:id])
          user.update(user_params)
          render json: { status: 200, message: "update the user", data: user }
        else
          render json: { status: 400, data: user.errors }
        end
      end

      def user_params
        params.require(:user).permit(:id, :firstName, :lastName, :age, :address, :memo, :staff_id, :created_at, :updated_at)
      end
    end
  end
end
