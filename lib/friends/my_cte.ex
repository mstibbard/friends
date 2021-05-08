defmodule Friends.MyCTE do
  @moduledoc """
  Nodes hierarchy
  """

  use CTE,
    otp_app: :friends,
    adapter: CTE.Adapter.Ecto,
    repo: Friends.Repo,
    nodes: Friends.Nodes,
    paths: Friends.Paths
end
