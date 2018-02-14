require 'spec_helper'

describe Stuart::Infrastructure::HttpClient do
  let(:environment) { Stuart::Infrastructure::Environment::SANDBOX }
  let(:authenticator) do
    Stuart::Infrastructure::Authenticator.new(environment, 'some-id',
                                              'some-secret')
  end
  let(:http_client) { Stuart::Infrastructure::HttpClient.new(authenticator) }

  let(:access_token) { 'some-access-token' }
  let(:ruby_gem_version) { Stuart::Version::STRING }
  let(:resource) { '/some-endpoint' }

  let(:expected_headers) do
    {
      'Authorization' => "Bearer #{access_token}",
      'User-Agent' => "stuart-client-ruby/#{ruby_gem_version}",
      'Content-Type' => 'application/json'
    }
  end

  before do
    allow(authenticator).to receive(:access_token).and_return(access_token)
  end

  describe '#perform_get' do
    before do
      allow(Typhoeus).to receive(:get).and_return(Typhoeus::Response.new)
    end

    subject(:get) { http_client.perform_get(resource) }

    it 'calls Typhoeus with correct parameters' do
      expect(Typhoeus).to receive(:get).with("#{environment[:base_url]}#{resource}",
                                             headers: expected_headers)
      get
    end
  end

  describe '#perform_post' do
    before do
      allow(Typhoeus).to receive(:post).and_return(Typhoeus::Response.new)
    end

    let(:body) { 'some-body' }

    subject(:post) { http_client.perform_post(resource, body) }

    it 'calls Typhoeus with correct parameters' do
      expect(Typhoeus).to receive(:post).with("#{environment[:base_url]}#{resource}",
                                              headers: expected_headers,
                                              body: body)
      post
    end
  end
end
