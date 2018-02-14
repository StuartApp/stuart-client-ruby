require 'spec_helper'
require 'securerandom'

describe Stuart::Infrastructure::Authenticator do
  let(:environment) { Stuart::Infrastructure::Environment::SANDBOX }
  let(:authenticator) do
    Stuart::Infrastructure::Authenticator.new(environment, 'some-id',
                                              'some-secret')
  end

  let(:client_credentials_double) { instance_double('OAuth2::Strategy::ClientCredentials') }

  before do
    allow(OAuth2::Strategy::ClientCredentials).to receive(:new)
      .and_return(client_credentials_double)
    allow(client_credentials_double).to receive(:get_token)
      .and_return(OAuth2::AccessToken.new(nil, 'new-access-token'))
  end

  describe '#access_token' do
    subject(:access_token) { authenticator.access_token }

    context 'when no access token exists' do
      it 'returns a new access token' do
        expect(access_token).to eq('new-access-token')
      end
    end

    context 'when a valid access token already exists' do
      let(:oauth_access_token) { OAuth2::AccessToken.new(nil, 'existing-access-token') }

      before do
        authenticator.instance_variable_set(:@access_token, oauth_access_token)
        allow(authenticator).to receive(:has_valid_token?).and_return(true)
      end

      it 'returns the current valid access token' do
        expect(access_token).to eq('existing-access-token')
      end
    end

    context 'when a non valid access token already exists' do
      before do
        allow(authenticator).to receive(:has_valid_token?).and_return(false)
      end

      it 'returns a new access token' do
        expect(access_token).to eq('new-access-token')
      end
    end
  end
end
