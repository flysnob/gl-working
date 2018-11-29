require 'square_connect'

class ProcessPayment
  class << self
    def perform
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
        puts locations
      rescue SquareConnect::ApiError => e
        puts "Error encountered while loading the locations: #{e.message}"
      end

      location = locations.detect do |l|
        l.capabilities.include?("CREDIT_CARD_PROCESSING")
      end

      if location.nil?
        raise "Activation required.
        Visit https://squareup.com/activate to activate and begin taking payments."
      end

      puts location
    end
  end
end
