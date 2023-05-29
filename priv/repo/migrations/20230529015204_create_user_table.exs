defmodule CookbookApi.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  @disable_ddl_transaction true
  @disable_migration_lock true

  def change do
    create table(:users) do
      add(:uid, :uuid, default: fragment("gen_random_uuid()"), null: false, primary_key: true)

      add(:first_name, :string, null: false)
      add(:last_name, :string, null: false)
      add(:email, :string, null: false)
      add(:password, :string, null: false)

      add(:recipe_ids, {:array, :string})

      timestamps()
    end

    create(unique_index(:users, [:email], name: :xid_user_email, concurrently: true))
  end
end
