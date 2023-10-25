defmodule PlexRequestWeb.Router do
  use PlexRequestWeb, :router
  import Plug.BasicAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PlexRequestWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :basicauth do
    plug :basic_auth,
      username: System.get_env("AUTH_USERNAME"),
      password: System.get_env("AUTH_PASSWORD")
  end

  def auth(conn, _opts) do
    token = case conn |> get_req_header("x-api-token") do
              [] -> nil
              token -> token
            end

    correct_token = System.get_env("API_TOKEN")

    case token do
      nil -> conn
             |> put_resp_header("Content-Type", "application/json")
             |> resp(401, '{"message": "Missing `X-Api-Token` header`"}')
             |> halt()
      [cmptoken] -> case Plug.Crypto.secure_compare(correct_token, cmptoken) do
                  true -> conn
                  false -> conn
                           |> put_resp_header("Content-Type", "application/json")
                           |> resp(401, '{"message": "Wrong `X-Api-Token`"}')
                           |> halt()
                end
    end
  end

  pipeline :tokenauth do
    plug :auth
  end

  scope "/", PlexRequestWeb do
    pipe_through [:basicauth, :browser]

    resources "/source", SourceController, except: [:index, :show]
    resources "/request", RequestController, except: [:index, :show]
    resources "/server", ServerController, except: [:index, :show]
    resources "/library", LibraryController, except: [:index, :show]
  end

  scope "/", PlexRequestWeb do
    pipe_through :browser

    resources "/source", SourceController, only: [:index, :show]
    resources "/request", RequestController, only: [:index, :show]
    resources "/server", ServerController, only: [:index, :show]
    resources "/library", LibraryController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  scope "/api", PlexRequestWeb do
    pipe_through [:api, :auth]

    resources "/request", Api.RequestController, except: [:index, :show]
    resources "/source", Api.SourceController, except: [:index, :show]
    resources "/server", Api.ServerController, except: [:index, :show]
    resources "/library", Api.LibraryController, except: [:index, :show]
  end

  scope "/api", PlexRequestWeb do
    pipe_through :api

    resources "/request", Api.RequestController, only: [:index, :show]
    resources "/source", Api.SourceController, only: [:index, :show]
    resources "/server", Api.ServerController, only: [:index, :show]
    resources "/library", Api.LibraryController, only: [:index, :show]
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:plex_request, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PlexRequestWeb.Telemetry
    end
  end
end
