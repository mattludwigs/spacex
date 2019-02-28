defmodule SpaceX do

  def get(%{endpoint: endpoint}) do
    base_url = "https://api.spacexdata.com/v3"
    HTTPoison.get(base_url <> endpoint)
  end

  def parse_response(response) do
    Jason.decode(response.body)
  end

  def get_info() do
    endpoint = "/info"

    with {:ok, response} <- get(endpoint),
         {:ok, _} = okay <- Jason.decode(response.body) do
      okay
    else
      error -> error
    end
  end

  @spec get_rockets() :: map()
  def get_rockets() do
    %{
      endpoint: "/rockets"
    }
  end

  @spec gets_rockets() :: {:ok, map()} | {:error, any()}
  def gets_rockets() do
    endpoint = "/rockets"

    with {:ok, response} <- get(endpoint),
         {:ok, _} = okay <- Jason.decode(response.body) do
      okay
    else
      error -> error
    end
  end
end
