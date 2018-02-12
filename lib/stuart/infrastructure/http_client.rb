require 'typhoeus'
require 'json'

module Stuart
  module Infrastructure
    class HttpClient
      def initialize(authenticator)
        @authenticator = authenticator
      end

      def perform_get(resource)
        url = "#{@authenticator.environment[:base_url]}/#{resource}"
        request = Typhoeus::Request.new(
          url,
          method: :get,
          headers: default_header
        )
        response = request.response

        # Define the error handling that will execute after the request is run
        request.on_complete do |response|
          if response.success?
            puts 'success'
            # bto_api_response(response)
          elsif response.timed_out?
            # time out error
            ApiResponse.new(504, 'request timed out')
          elsif response.code == 0
            # Could not get an http response, something's wrong.
            ApiResponse.new(503, 'Service unavailable')
          end
        end

        # run the request
        to_api_response request.run

        # trigger the on_complete block
      end

      def default_header
        { 'Authorization' => "Bearer #{@authenticator.access_token}",
          'User-Agent' => 'stuart-ruby-client/1.0.0',
          'Content-Type' => 'application/json' }
      end

      private

      def to_api_response(typhoeus_response)
        status_code = typhoeus_response.response_code
        body = JSON.parse(typhoeus_response.response_body)
        ApiResponse.new(status_code, body)
      end
    end
  end
end
