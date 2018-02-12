require 'oauth2'

module Stuart
  module Infrastructure
    class Authenticator
      attr_reader :environment

      def initialize(environment, api_client_id, api_client_secret)
        @environment = environment
        @oauth_client = OAuth2::Client.new(api_client_id, api_client_secret, site: environment[:base_url])
      end

      def access_token
        @access_token ||= @oauth_client.client_credentials.get_token.token
      end
    end
  end
end
