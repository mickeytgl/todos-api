module ExceptionHandler
  extend ActiveSupport::Concern

  # Define custom error subclasses - rescue catches Standard Errors
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    # Define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissintToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found )
    end
  end

    private

    def four_twenty_two
      json_response({ message: e.message }, :unprocessable_entity)
    end
    
    def unauthorized_request(e)
      json_response({ message: e.message }, :unauthorized)
    end
  end
