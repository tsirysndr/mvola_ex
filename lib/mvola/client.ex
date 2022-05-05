defmodule MVola.Client do
  @sandbox_url "https://devapi.mvola.mg"
  @production_url "https://api.mvola.mg"

  def get(path, headers, is_sandbox) when is_sandbox == true do
    :get
    |> Finch.build(@sandbox_url <> path, headers)
    |> Finch.request(MVola.Application.http_name())
  end

  def get(path, headers, is_sandbox) when is_sandbox == false do
    :get
    |> Finch.build(@production_url <> path, headers)
    |> Finch.request(MVola.Application.http_name())
  end

  def post(path, headers, params, is_sandbox) when is_sandbox == true do
    :post
    |> Finch.build(@sandbox_url <> path, headers, params)
    |> Finch.request(MVola.Application.http_name())
  end

  def post(path, headers, params, is_sandbox) when is_sandbox == false do
    :post
    |> Finch.build(@production_url <> path, headers, params)
    |> Finch.request(MVola.Application.http_name())
  end
end
