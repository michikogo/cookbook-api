defmodule CookbookApi.Repo.Migrations.CreateRecipeTable do
  use Ecto.Migration

  @disable_ddl_transaction true
  @disable_migration_lock true

  def change do
    create table(:recipes) do
      add(:uid, :uuid, default: fragment("gen_random_uuid()"), null: false, primary_key: true)

      add(:title, :string, null: false)
      add(:description, :string, null: false)

      add(:ingredients, {:array, :string}, null: false)
      add(:instructions, {:array, :text}, null: false)

      add(:prep_time, :string, null: false)
      add(:cook_time, :string, null: false)
      add(:total_time, :string)

      add(:tags, {:array, :string})

      timestamps()
    end

    create(
      unique_index(:recipes, [:title, :uid], name: :xid_recipe_uid_title, concurrently: true)
    )
  end
end
