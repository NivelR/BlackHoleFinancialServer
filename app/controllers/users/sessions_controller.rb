class Users::SessionsController < Devise::SessionsController
  include ActionController::ImplicitRender
  # Require our abstraction for encoding/deconding JWT.
  # require 'auth_token'

  # Disable CSRF protection
  # skip_before_action :verify_authenticity_token

  # Be sure to enable JSON.
  respond_to :html, :json

  # POST /resource/sign_in
  # Resets the authentication token each time! Won't allow you to login on two devices
  # at the same time (so does logout).
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)

    current_user.update authentication_token: nil

    respond_to do |format|
      format.json {
        render :json => {
          :user => current_user,
          :status => :ok,
          :authentication_token => current_user.authentication_token
        }
      }
    end
  end

  # DELETE /resource/sign_out
  def destroy

    respond_to do |format|
      format.json {
        if current_user
          current_user.update authentication_token: nil
          signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
          render :json => {}.to_json, :status => :ok
        else
          render :json => {}.to_json, :status => :unprocessable_entity
        end


      }
    end
  end

  # POST /resource/sign_in
  # def create

    # This is the default behavior from devise - view the sessions controller source:
    # https://github.com/plataformatec/devise/blob/master/app/controllers/devise/sessions_controller.rb#L16
    # self.resource = warden.authenticate!(auth_options)
    # set_flash_message(:notice, :signed_in) if is_flashing_format?
    # sign_in(resource_name, resource)
    # yield resource if block_given?

    # Here we're deviating from the standard behavior by issuing our JWT
    # to any JS based client.
    # token = AuthToken.issue_token({ user_id: resource.id })
    # respond_to do |format|
      # format.json { render json: {user: resource.email, token: token} }
    # end

    # The default behavior would have been to simply fire respond_with:
    # respond_with resource, location: after_sign_in_path_for(resource)
  # end
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
