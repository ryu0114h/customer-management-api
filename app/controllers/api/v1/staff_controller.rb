class Api::V1::StaffController < ApplicationController
  def index
    if staff = Staff.find(current_api_v1_staff.id)
      render json: { status: 200, message: "Loaded staff", data: staff }
    else
      render json: { status: 400, message: "Not Loaded staff" }
    end
  end
end
