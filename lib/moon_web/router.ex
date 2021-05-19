defmodule MoonWeb.Router do
  use MoonWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {MoonWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admin do
    plug(:put_root_layout, {Backoffice.LayoutView, :backoffice})
  end

  scope "/", MoonWeb do
    pipe_through [:browser, :admin]

    live "/", DashboardLive

    live "/users", UserLive.Index
    live "/users/:id/edit", UserLive.Single

    live "/spaceships", SpaceshipLive.Index
    live "/spaceships/:id/edit", SpaceshipLive.Single

    live "/rides", RideLive.Index
    live "/rides/:id/edit", RideLive.Single

    live "/journeys", JourneyLive.Index
    live "/journeys/:id/edit", JourneyLive.Single

    live "/manufacturers", ManufacturerLive.Index
    live "/manufacturers/new", ManufacturerLive.Single
    live "/manufacturers/:id/edit", ManufacturerLive.Single
  end

  # Other scopes may use custom stacks.
  # scope "/api", MoonWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: MoonWeb.Telemetry
    end
  end
end
