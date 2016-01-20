defmodule CodeCasket.Repo.Migrations.AddSlugToCodes do
  use Ecto.Migration

  def change do
    alter table(:codes) do
      add :slug, :string, null: false
    end

    create index(:codes, [:slug], unique: true)
  end
end
