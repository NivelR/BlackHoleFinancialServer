class ApplicationController < ActionController::API
  # protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  acts_as_token_authentication_handler_for User, fallback_to_devise: false

  private

    def require_authentication!
      throw(:warden, scope: :user) unless current_user.presence
    end
end
