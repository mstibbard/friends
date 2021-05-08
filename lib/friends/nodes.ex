defmodule Friends.Nodes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "nodes" do
    field :name, :string
  end

  def changeset(params \\ %{}) do
    %Friends.Nodes{}
    |> cast(params, [:name])
    |> validate_required(:name)
  end
end
