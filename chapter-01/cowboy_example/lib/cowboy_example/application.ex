defmodule CowboyExample.Application do
  @moduledoc false

  use Application

  # Default port is 4040
  @port Application.compile_env(:cowboy_example, :port, 4040)

  @impl true
  def start(_type, _args) do
    children = [
      {Task, fn -> CowboyExample.Server.start(@port) end}
    ]

    opts = [strategy: :one_for_one, name: CowboyExample.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
