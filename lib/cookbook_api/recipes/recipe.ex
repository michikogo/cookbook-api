defmodule CookbookApi.Recipes.Recipe do
  use Ecto.Schema

  import Ecto.Changeset

  @required_fields [
    :title,
    :description,
    :ingredients,
    :instructions,
    :prep_time,
    :cook_time
  ]

  @fields @required_fields ++
            [
              :uid,
              :total_time,
              :tags
            ]

  schema "recipes" do
    field(:uid, Ecto.UUID, primary_key: true)

    field(:title, :string)
    field(:description, :string)

    field(:ingredients, {:array, :string})
    field(:instructions, {:array, :string})

    field(:prep_time, :string)
    field(:cook_time, :string)
    field(:total_time, :string)

    field(:tags, {:array, :string})

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @fields)
    |> validate_required(@required_fields)
  end
end
