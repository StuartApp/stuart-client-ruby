module Stuart
  class Client
    attr_reader :http_client

    def initialize(http_client)
      @http_client = http_client
    end

    def get_job(job_id)
      http_client.perform_get("/v2/jobs/#{job_id}")
    end
  end
end
