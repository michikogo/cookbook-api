defmodule CookbookApi.Factory do
  @moduledoc """
  The Factory module.
  """
  alias CookbookApi.Repo
  alias CookbookApi.Users.User

  def build(factory_name, attributes) do
    factory_name |> build() |> struct(attributes)
  end

  def insert!(factory_name, attributes \\ []) do
    Repo.insert!(build(factory_name, attributes))
  end

  def build(:users) do
    %User{
      uid: Ecto.UUID.generate(),
      first_name: "John",
      last_name: "Doe",
      email: "john.doe@gmail.com",
      password: Argon2.hash_pwd_salt("password"),
      recipe_ids: ["1"]
    }
  end
end
