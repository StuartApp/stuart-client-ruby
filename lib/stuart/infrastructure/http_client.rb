require 'typhoeus'
require 'json'

module Stuart
  module Infrastructure
    class HttpClient
      def initialize(authenticator)
        @authenticator = authenticator
      end

      def perform_get(resource)
        to_api_response Typhoeus.get(url(resource), headers: default_header)
      end

      def perform_post(resource, body)
        to_api_response Typhoeus.post(url(resource), headers: default_header, body: body)
      end

      private

      def url(resource)
        "#{@authenticator.environment[:base_url]}#{resource}"
      end

      def default_header
        {'Authorization' => "Bearer #{@authenticator.access_token}",
         'User-Agent' => 'stuart-client-ruby/1.0.0',
         'Content-Type' => 'application/json'}
      end

      def to_api_response(response)
        status_code = response.response_code
        body = JSON.parse(response.response_body) if response.response_body
        ApiResponse.new(status_code, body)
      end
    end
  end
end
