module Stuart
  module Infrastructure

    class Client
      attr_reader :http_client

      def initialize(http_client)
        @http_client = http_client
      end

      def get_job(job_id)
        http_client.perform_get("/v2/jobs/#{job_id}")
      end

      def get_phone_number(delivery_id)
        http_client.perform_get("/v2/deliveries/#{delivery_id}/phone_number")
      end
    end
  end
end