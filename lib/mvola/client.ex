defmodule MVola.Client do

  @base_url Application.get_env(:mvola, :api_base_url)

  def get(path, headers) do
    :get
    |> Finch.build(@base_url <> path, headers)
    |> Finch.request(MVola.Application.http_name())
  end

  def post(path, headers, params) do
    :post
    |> Finch.build(@base_url <> path, headers, params)
    |> Finch.request(MVola.Application.http_name())
  end
end
