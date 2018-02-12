require 'spec_helper'

describe Stuart::Infrastructure::HttpClient do

  let(:environment) { Stuart::Infrastructure::Environment::SANDBOX }
  let(:authenticator) do
    Stuart::Infrastructure::Authenticator.new(environment, 'some-id', 'some-secret')
  end
  let(:http_client) { Stuart::Infrastructure::HttpClient.new(authenticator) }

  let(:sample_access_token) { 'some-access-token' }
  let(:ruby_gem_version) { '1.0.0' }

  before do
    allow(authenticator).to receive(:access_token).and_return(sample_access_token)
  end

  describe '#perform_get' do
    before do
      allow(Typhoeus).to receive(:get).and_return(Typhoeus::Response.new)
    end

    let(:resource) { '/v2/jobs' }

    subject(:get) { http_client.perform_get(resource) }

    it 'calls Typhoeus with correct parameters' do
      expect(Typhoeus).to receive(:get).with("#{environment[:base_url]}#{resource}",
                                             headers: {
                                               'Authorization' => "Bearer #{sample_access_token}",
                                               'User-Agent' => "stuart-client-ruby/#{ruby_gem_version}",
                                               'Content-Type' => 'application/json'
                                             })
      get
    end
  end
end
