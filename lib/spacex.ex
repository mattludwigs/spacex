defmodule SpaceX do
  defmodule Request do
    @opaque t :: %__MODULE__{}

    @enforce_keys [:endpoint]
    defstruct endpoint: nil

    @spec new(String.t()) :: t
    def new(endpoint) do
      %__MODULE__{endpoint: endpoint}
    end

    @doc """
    Get the endpoint for the request
    """
    @spec endpoint(t) :: String.t()
    def endpoint(%__MODULE__{endpoint: endpoint}), do: endpoint

    @spec run_request(t) :: {:ok, any} | {:error, any}
    def run_request(%__MODULE__{endpoint: endpoint}) do
      base_url = "https://api.spacexdata.com/v3"

      case HTTPoison.get(base_url <> endpoint) do
        {:ok, response} -> parse_response(response)
        error -> error
      end
    end

    defp parse_response(response) do
      Jason.decode(response.body)
    end
  end

  @spec info() :: Request.t()
  def info() do
    Request.new("/info")
  end

  @spec rockets() :: Request.t()
  def rockets() do
    Request.new("/rockets")
  end
end
