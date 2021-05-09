defmodule Friends.Repo.Migrations.AddSkillToNodes do
  use Ecto.Migration

  def change do
    alter table(:nodes) do
      add :skill, :string
    end
  end
end
