module Stuart
  module Infrastructure
    class Environment
      SANDBOX = { base_url: "https://api.sandbox.stuart.com" }.freeze

      PRODUCTION = { base_url: "https://api.stuart.com" }.freeze
    end
  end
end
