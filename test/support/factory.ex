defmodule CookbookApi.Factory do
  @moduledoc """
  The Factory module.
  """

  alias CookbookApi.Repo
  alias CookbookApi.Users.User
  alias CookbookApi.Recipes.Recipe

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

  def build(:recipes) do
    %Recipe{
      uid: Ecto.UUID.generate(),
      title: "Strawberry Shortcake",
      description:
        "Strawberry Shortcake is a simple yet impressive dessert that requires nothing but some fresh fruit and a few pantry staples.",
      ingredients: [
        "1 lb. fresh strawberries",
        "2 Tbsp sugar",
        "2.5 cups all-purpose flour",
        "1 tsp salt",
        "2 Tbsp sugar",
        "4 tsp baking powder",
        "2 cups heavy whipping cream",
        "1 cup heavy whipping cream",
        "2 Tbsp sugar",
        "1 tsp vanilla extract"
      ],
      instructions: [
        "Rinse the strawberries well, then remove the stems and leaves by scooping them out with a spoon. Slice the strawberries lengthwise into about four slices each. Place the sliced strawberries in a bowl, add 2 Tbsp sugar, stir, and set them aside. The sugar will draw out the juice from the strawberries as they sit and create a delicious strawberry syrup. Stir the strawberries occasionally as they sit.",
        "Begin to preheat the oven to 400ºF for the biscuits. Line a baking sheet with parchment paper. Stir together the flour, salt, sugar, and baking powder in a bowl until they are very well combined.",
        "Add the heavy whipping cream to the bowl with the flour and stir until a sticky dough forms and no dry flour remains on the bottom of the bowl.",
        "Dust your hands with flour, then divide the dough into eight pieces, and roughly shape the pieces into circles, about an inch to an inch and a half thick. Place the shaped biscuits onto the baking sheet. Bake in the preheated oven for about 25 minutes, or until they are lightly golden brown on top.",
        "While the biscuits are baking, prepare the vanilla whipped cream. Add the heavy whipping cream, sugar, and vanilla to a glass or metal bowl. Whisk vigorously by hand, or use a mixer, until soft peaks form. Be careful not to over whisk the cream, or it can break and separate.",
        "Once the biscuits have baked, let them sit until they are cool enough to handle. Carefully slice the biscuits in half. Spoon some of the strawberries and strawberry syrup from the bottom of the bowl onto the bottom of each biscuit. Top with a large dollop of whipped cream, then the top half of the biscuit. Finish each stack off with one more dollop of whipped cream, a few strawberry slices, and a drizzle of the strawberry syrup."
      ],
      prep_time: "15 minutes",
      cook_time: "25 minutes",
      total_time: "40 minutes",
      tags: ["strawberry", "shortcake", "dessert"]
    }
  end
end
