defmodule PlexRequestWeb.IndexController do
  use PlexRequestWeb, :controller
  use Phoenix.LiveView

  def index_html() do
    """
    <html lang="en">
    <head>
      <meta charset="utf8" />
      <title>plex request</title>
    </head>
    <body>
      <ul>
        <li><a href="/source">source</a></li>
        <li><a href="/request">request</a></li>
        <li><a href="/server">server</a></li>
        <li><a href="/library">library</a></li>
        <li><a href="/server_library">server library</a></li>
        <li><a href="/server_library_item">server library item</a></li>
        <li><a href="/request_fulfilment">request fulfilment</a></li>
      </ul>
    </body>
    </html>
    """
  end

  def index(conn, _params) do
    conn
    |> html(index_html())
  end

  def health(conn, _params) do
    conn
    |> put_status(200)
    |> text("")
  end
end
