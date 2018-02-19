[ ![Codeship Status for StuartApp/stuart-client-ruby](https://app.codeship.com/projects/47814430-f49c-0135-ebec-46d7136b8c34/status?branch=master)](https://app.codeship.com/projects/273162)

# Stuart Ruby Client
For a complete documentation of all endpoints offered by the Stuart API, you can visit [Stuart API documentation](https://stuart.api-docs.io).

## Install
``` bash
$ gem install stuart-client-ruby
```

## Usage

### Initialize HTTP client

```ruby
environment = Stuart::Infrastructure::Environment::SANDBOX
api_client_id = 'c6058849d0a056fc743203acb8e6a850dad103485c3edc51b16a9260cc7a7689' # can be found here: https://admin-sandbox.stuart.com/client/api
api_client_secret = 'aa6a415fce31967501662c1960fcbfbf4745acff99acb19dbc1aae6f76c9c618' # can be found here: https://admin-sandbox.stuart.com/client/api
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
          phone: "+33698348756'",
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
