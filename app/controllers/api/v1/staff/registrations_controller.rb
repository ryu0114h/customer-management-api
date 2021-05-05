# frozen_string_literal: true

class Api::V1::Staff::RegistrationsController < DeviseTokenAuth::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  include Rails.application.routes.url_helpers

  # protected

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name postal_code address introduction_text image_url])
  end

  def update
    if image_params[:image_url].present?
      image_match = params[:image_url].match(/^data:(.*?);(?:.*?),(.*)$/)
      mime_type, encoded_image = image_match.captures
      extension = mime_type.split('/').second
      decoded_image = Base64.decode64(encoded_image)
      filename = "image#{current_api_v1_staff.id}.#{extension}"
      image_path = "#{Rails.root}/tmp/storage/#{filename}"
      File.open(image_path, 'wb') do |f|
        f.write(decoded_image)
      end
      current_api_v1_staff.image.attach({ io: File.open(image_path), filename: filename, content_type: mime_type })
      current_api_v1_staff[:image_url] = encoded_image
    else
      current_api_v1_staff[:image_url] = nil
    end

    if current_api_v1_staff.update(staff_params)
      render json: { status: 200, message: 'update the staff', data: current_api_v1_staff }
    else
      render json: { status: 400, data: current_api_v1_staff.errors }
    end
  end

  private

  def staff_params
    params.permit(:name, :email, :postal_code, :address, :introduction_text)
  end

  def image_params
    params.permit(:image_url)
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
