defmodule SpaceX.RequestTest do
  use ExUnit.Case, async: true

  alias SpaceX.Request

  test "Creates new Request" do
    assert %Request{} = Request.new("/hello")
  end

  test "has an endpoint" do
    request = Request.new("/hello")
    assert "/hello" == Request.endpoint(request)
  end
end
