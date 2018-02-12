module Stuart
  module Infrastructure

    class ApiResponse

      attr_reader :status_code, :body

      def initialize(status_code, body)
        @status_code = status_code
        @body = body
      end

      def success
        @status_code == (200 || 201)
      end

    end
  end
end