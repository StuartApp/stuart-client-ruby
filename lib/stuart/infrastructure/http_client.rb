require 'typhoeus'
require 'json'

module Stuart
  module Infrastructure
    class HttpClient
      def initialize(authenticator)
        @authenticator = authenticator
      end

      def perform_get(resource)
        request = Typhoeus::Request.new(
          url(resource),
          method: :get,
          headers: default_header
        ).on_complete {|response| response_callback(response)}

        to_api_response request.run
      end

      def default_header
        {'Authorization' => "Bearer #{@authenticator.access_token}",
         'User-Agent' => 'stuart-ruby-client/1.0.0',
         'Content-Type' => 'application/json'}
      end

      private

      def url(resource)
        "#{@authenticator.environment[:base_url]}/#{resource}"
      end

      def response_callback(response)
        if response.code.zero?
          ApiResponse.new(503, 'Service unavailable')
        end
      end

      def to_api_response(typhoeus_response)
        status_code = typhoeus_response.response_code
        body = JSON.parse(typhoeus_response.response_body)
        ApiResponse.new(status_code, body)
      end
    end
  end
end
