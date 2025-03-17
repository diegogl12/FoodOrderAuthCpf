defmodule Endpoints do
  use Plug.Router
  require Logger

  alias AuthCpf.Clients.FoodOrderClient

  plug :match

  plug Plug.Parsers, parsers: [:json], pass: ["application/json"], json_decoder: Jason

  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Hello... All good!")
  end

  get "auth/:cpf" do
    Logger.info("Authenticating the following cpf: #{cpf}...")

    case FoodOrderClient.fetch_by_cpf(cpf) do
      {:ok, _} -> send_resp(conn, 200, "Cpf #{cpf} authenticated!")
      {:error, error, reason} -> 
        Logger.error("Request error: #{reason}")
        send_resp(conn, 403, "Not authorized! Reason: #{error}")
    end
  end

  match _ do
    send_resp(conn, 404, "Page not found")
  end
end
