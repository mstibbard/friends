defmodule Friends.Nodes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "nodes" do
    field :name, :string
    field :skill, :string
  end

  def changeset(params \\ %{}) do
    %Friends.Nodes{}
    |> cast(params, [:name, :skill])
    |> validate_required(:name, :skill)
  end
end
