defmodule PlexRequest.Repo do
  use Ecto.Repo,
    otp_app: :plex_request,
    adapter: Ecto.Adapters.Postgres
end
