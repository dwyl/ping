defmodule Ping do
  import Plug.Conn

  # This is the Binary encoding for a 1x1 transparent pixel GIF
  # stackoverflow.com/questions/4665960/most-efficient-way-to-display-a-1x1-gif
  @img <<71, 73, 70, 56, 57, 97, 1, 0, 1, 0, 128, 0, 0, 255, 255, 255, 0, 0, 0,
  33, 249, 4, 1, 0, 0, 0, 0, 44, 0, 0, 0, 0, 1, 0, 1, 0, 0, 2, 2, 68, 1, 0, 59>>

  # apparently adding the "content-length" header speeds response time by 10%!
  @size byte_size(@img) |> to_string

  @doc """
  `render_pixel/2` renders a 1x1 pixel GIF with appropriate headers.
  """
  def render_pixel(conn, _params) do
    conn # instruct browser not to cache the image
    |> put_resp_header("cache-control", "no-store, private")
    |> put_resp_header("pragma", "no-cache")
    |> put_resp_content_type("image/gif")
    |> put_resp_header("content-length", @size)
    |> send_resp(200, @img)
  end
end
