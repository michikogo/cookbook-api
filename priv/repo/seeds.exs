# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CookbookApi.Repo.insert!(%CookbookApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Code.require_file("factory.ex", "test/support")

alias CookbookApi.Factory

Factory.insert!(:users,
  uid: Ecto.UUID.generate(),
  first_name: "Olivia",
  last_name: "Benson",
  email: "olivia.benson@gmail.com",
  password: Argon2.hash_pwd_salt("password"),
  recipe_ids: ["2"]
)

Factory.insert!(:users,
  uid: Ecto.UUID.generate(),
  first_name: "Mariska",
  last_name: "Hargitay",
  email: "mariska.haritay@gmail.com",
  password: Argon2.hash_pwd_salt("password"),
  recipe_ids: ["3"]
)
