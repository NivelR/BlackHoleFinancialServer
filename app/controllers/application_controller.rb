class ApplicationController < ActionController::API
  # protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  acts_as_token_authentication_handler_for User

  # Apply strong_parameters filtering before CanCan authorization
  # See https://github.com/ryanb/cancan/issues/571#issuecomment-10753675
  # before_filter do
  #   resource = controller_name.singularize.to_sym
  #   method = "#{resource}_params"
  #   params[resource] &&= send(method) if respond_to?(method, true)
  # end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
end
