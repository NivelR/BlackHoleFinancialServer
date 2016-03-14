class Users::SessionsController < Devise::SessionsController
  skip_before_filter :verify_signed_out_user

  # POST /resource/sign_in
  # Resets the authentication token each time! Won't allow you to login on two devices
  # at the same time (so does logout).
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)

    current_user.update authentication_token: nil

    render :json => {
           :user => current_user,
           :status => :ok,
           :authentication_token => current_user.authentication_token
    }
  end

  # DELETE /resource/sign_out
  def destroy
    if current_user
      current_user.update_attribute(:authentication_token, nil)
      signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
      head 204
    else
      head 400
    end
  end

  def set_flash_message(key, kind, options = {})
    message = find_message(kind, options)
    render :json => {:message => message}
  end

end
