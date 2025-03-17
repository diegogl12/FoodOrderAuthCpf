import Config

config :auth_cpf, :api,
  port: 4000

config :auth_cpf, :food_order_client,
  base_url: System.get_env("FOOD_ORDER_ENDPOINT", "http://localhost:3000") 

config :tesla, adapter: Tesla.Adapter.Mint

