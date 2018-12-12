require 'square_connect'

class ProcessPayment
  class << self
    def perform(user = nil, params = nil)
      # Setup authorization
      SquareConnect.configure do |config|
        # Configure OAuth2 access token for authorization: oauth2
        config.access_token = 'sandbox-sq0atb-aWaTagWOPgQ3vorUOGIhYQ'
      end

      # The SDK throws an exception if a Connect endpoint responds with anything besides 200 (success).
      # This block catches any exceptions that occur from the request.
      locations_api = SquareConnect::LocationsApi.new

      begin
        locations = locations_api.list_locations.locations
      rescue SquareConnect::ApiError => e
        Rails.logger.error("Error encountered while loading the locations: #{e.message}")
      end

      location = locations.detect do |l|
        l.capabilities.include?("CREDIT_CARD_PROCESSING")
      end

      if location.nil?
        raise 'Activation required.'
        Rails.logger.error('Visit https://squareup.com/activate to activate and begin taking payments.')
      end

      if user && params
        request_body = {
                         card_nonce: params[:nonce],
                         amount_money: { amount: params[:amount].to_i, currency: 'USD' },
                         idempotency_key: "#{user.id}_#{Time.now.to_formatted_s(:number)}"
                       }

        result = process_charge(location.id, request_body)
        handle_result(result)
      else
        puts location
      end
    end

    def process_charge(location, request_body)
      transaction_api = SquareConnect::TransactionsApi.new
      transaction_api.charge(location, request_body)
    rescue StandardError => e
      return e
    end

    def handle_result(result)
      return result if result.transaction.id
    end
  end
end
