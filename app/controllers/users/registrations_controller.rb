class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
# prepend_before_filter :require_no_authentication, only: [:new, :create, :cancel]
  skip_before_action :authenticate_scope!

  def create
    @user = User.create(user_params)
    if @user.save
      render json: {data: @user}, status: 201
    else
      render json: {errors: @user.errors}, status: 422
    end

  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: {data: @user}, status: 200
    else
      render json: {errors: @user.errors}, status: 422
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head 204
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

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
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
