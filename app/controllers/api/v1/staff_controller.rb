class Api::V1::StaffController < ApplicationController
  def index
    if current_api_v1_staff
      render json: { status: 200, message: 'Loaded staff', data: current_api_v1_staff }
    else
      render json: { status: 400, message: 'Not Loaded staff' }
    end
  end
end
