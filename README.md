[![Codeship Status for StuartApp/stuart-client-ruby](https://app.codeship.com/projects/bacc9100-b159-0137-6e98-0e2ebd2815ea/status?branch=master)](https://app.codeship.com/projects/363050)

# Stuart Ruby Client
For a complete documentation of all endpoints offered by the Stuart API, you can visit [Stuart API documentation](https://api-docs.stuart.com/).

## Install
``` bash
$ gem install stuart-client-ruby
```

## Usage

### Initialize HTTP client

```ruby
require 'stuart-client-ruby'
environment = Stuart::Infrastructure::Environment::SANDBOX
api_client_id = 'c6058849d0a056fc743203acb8e6a850dad103485c3edc51b16a9260cc7a7689' # can be found here: https://admin.sandbox.stuart.com/client/api
api_client_secret = 'aa6a415fce31967501662c1960fcbfbf4745acff99acb19dbc1aae6f76c9c618' # can be found here: https://admin.sandbox.stuart.com/client/api
auth = Stuart::Infrastructure::Authenticator.new(environment, api_client_id, api_client_secret)

http_client = Stuart::Infrastructure::HttpClient.new(auth)
```

### Custom requests

#### Example: create a job

```ruby
job = {
  job: {
    transport_type: "bike",
    pickups: [
      {
        address: "46 Boulevard Barbès, 75018 Paris",
        comment: "Wait outside for an employee to come.",
        contact: {
          firstname: "Martin",
          lastname: "Pont",
          phone: "+33698348756",
          company: "KFC Paris Barbès"
        }
      }
    ],
    dropoffs: [
      {
        address: "156 rue de Charonne, 75011 Paris",
        package_description: "Red packet.",
        client_reference: "12345678ABCDE", # must be unique
        comment: "code: 3492B. 3e étage droite. Sonner à Durand.",
        contact: {
          firstname: "Alex",
          lastname: "Durand",
          phone: "+33634981209",
          company: "Durand associates."
        }
      }
    ]
  }
}

http_client.perform_post '/v2/jobs', JSON.generate(job)
```

#### Example: get a list of jobs

```ruby
http_client.perform_get('/v2/jobs')
```

### Release process

1. Review the Gem version in lib/stuart-client-ruby/version.rb
2. Create and publish a Git tag with the version defined in lib/stuart-client-ruby/version.rb
Example:
```
git tag v1.2.0-rc.1
git push origin --tags
```

3. The workflow [workflows/publish.yml](https://github.com/StuartApp/stuart-client-ruby/actions/workflows/publish.yml) should start and publish the new version to Rubygems https://rubygems.org/gems/stuart-client-ruby
