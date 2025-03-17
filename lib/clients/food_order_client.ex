defmodule AuthCpf.Clients.FoodOrderClient do

  def fetch_by_cpf(cpf) do
    client = Tesla.client([
      {Tesla.Middleware.BaseUrl, base_url()}, 
      Tesla.Middleware.JSON,
    ])

    case Tesla.get(client, "/Cliente/ConsultarPorCpf/#{cpf}") do
      {:ok, %{status: 200, body: body}} ->
        {:ok, body}
      {:ok, %{status: 404}, body: reason} ->
        {:error, :not_found, reason}
      {_, reason} -> {:error, :internal_server_error, reason}
    end
  end

  defp base_url, do: Application.get_env(:auth_cpf, :food_order_client) |> Keyword.get(:base_url)
end

