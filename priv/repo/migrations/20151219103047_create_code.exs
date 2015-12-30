defmodule CodeCasket.Repo.Migrations.CreateCode do
  use Ecto.Migration

  def change do
    create table(:codes) do
      add :title, :string
      add :body, :text

      timestamps
    end

  end
end
