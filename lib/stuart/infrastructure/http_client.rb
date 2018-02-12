require 'typhoeus'
require 'json'

module Stuart
  module Infrastructure
    class HttpClient
      def initialize(authenticator)
        @authenticator = authenticator
      end

      def perform_get(resource)
        perform_request(:get, resource, nil)
      end

      def perform_post(resource, body)
        perform_request(:post, resource, body)
      end

      private

      def url(resource)
        "#{@authenticator.environment[:base_url]}/#{resource}"
      end

      def default_header
        {'Authorization' => "Bearer #{@authenticator.access_token}",
         'User-Agent' => 'stuart-ruby-client/1.0.0',
         'Content-Type' => 'application/json'}
      end

      def perform_request(verb, resource, body)
        to_api_response Typhoeus::Request.new(
          url(resource),
          method: verb,
          headers: default_header,
          body: body
        ).run
      end

      def to_api_response(typhoeus_response)
        status_code = typhoeus_response.response_code
        body = JSON.parse(typhoeus_response.response_body)
        ApiResponse.new(status_code, body)
      end
    end
  end
end
