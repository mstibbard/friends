defmodule Friends.Repo.Migrations.CreatePaths do
  use Ecto.Migration

  def change do
    create table(:paths, primary_key: false) do
      add :ancestor, :bigint, null: false
      add :descendant, :bigint, null: false
      add :depth, :int, null: false, default: 0
    end

    create(index(:paths, [:ancestor, :descendant]))
  end
end
