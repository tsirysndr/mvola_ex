defmodule MVola.AuthTest do
  use Assertions.Case

  test "generate access token" do
    {:ok, expected} = File.read(Path.expand("fixtures/auth_response.json", __DIR__))
    {:ok, res} = MVola.Auth.generate_token("consumer_key", "consumer_secret")
    assert_maps_equal(res, Jason.decode!(expected), [:access_token, :expires_in, :scope, :token_type])
  end
end
