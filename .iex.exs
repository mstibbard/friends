try do
  Code.eval_file(".iex.exs", "~")
rescue
  Code.LoadError -> :rescued
end

import Ecto.Query
alias Friends.{MyCTE, Repo, Nodes, Paths}
alias Ecto.Multi
