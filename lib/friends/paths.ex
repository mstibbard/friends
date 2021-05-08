defmodule Friends.Paths do
  use Ecto.Schema
  import Ecto.Changeset
  alias Friends.Nodes

  @primary_key false

  schema "paths" do
    belongs_to :parent_node, Nodes, foreign_key: :ancestor
    belongs_to :node, Nodes, foreign_key: :descendant
    field :depth, :integer
  end

  def changeset(path, params \\ %{}) do
    path
    |> cast(params, [:ancestor, :descendant, :depth])
    |> validate_number(:ancestor, greater_than_or_equal_to: 0)
    |> validate_number(:descendant, greater_than_or_equal_to: 0)
  end
end
