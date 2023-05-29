defmodule CookbookApi.Users.User do
  @moduledoc """
  The User schema.
  """

  use Ecto.Schema

  import Ecto.Changeset

  @required_fields [
    :first_name,
    :last_name,
    :email,
    :password
  ]

  @fields @required_fields ++
            [
              :uid,
              :recipe_ids
            ]

  schema "users" do
    field(:uid, Ecto.UUID, primary_key: true)

    field(:first_name, :string)
    field(:last_name, :string)
    field(:email, :string)
    field(:password, :string)

    field(:recipe_ids, {:array, :string})

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@required_fields)
  end
end
