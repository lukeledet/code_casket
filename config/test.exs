use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :code_casket, CodeCasket.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :code_casket, CodeCasket.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: {:system, "DATABASE_URL"}
