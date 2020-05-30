defmodule PingTest do
  @moduledoc """
    If you want to understand how this test is set up, read: https://git.io/JfrZq
    That is where I discovered that I could in-line an entire Phoenix App
    in a single test file.
    """
    use ExUnit.Case, async: true
    use Plug.Test

    # Borrowed from: https://git.io/JfrZt
    def call(router, verb, path, params \\ nil) do
      verb
      |> conn(path, params)
      |> router.call(router.init([]))
    end

    defmodule Controller do
      use Phoenix.Controller

      def ping(conn, params), do: Ping.render_pixel(conn, params)
    end

    defmodule Router do
      use Phoenix.Router

      pipeline :any do
        plug :accepts, ~w(html)
      end

      scope "/" do
        pipe_through :any

        get "/ping", Controller, :ping
      end
    end

    test "routes to :ping and renders 1x1px GIF" do
      conn = call(Router, :get, "ping")
      assert conn.status == 200
      assert conn.state == :sent
      assert conn.resp_body =~ <<71, 73, 70, 56, 57>>
    end
end
