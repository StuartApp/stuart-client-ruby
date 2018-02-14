require 'oauth2'

module Stuart
  module Infrastructure
    class Authenticator
      attr_reader :environment

      def initialize(environment, api_client_id, api_client_secret)
        @environment = environment
        @oauth_client = OAuth2::Client.new(api_client_id,
                                           api_client_secret,
                                           site: environment[:base_url])
      end

      def access_token
        has_valid_token? ? @access_token.token : new_access_token.token
      end

      private

      def new_access_token
        @access_token = @oauth_client.client_credentials.get_token
      end

      def has_valid_token?
        !@access_token.nil? && !@access_token.expired?
      end
    end
  end
end
