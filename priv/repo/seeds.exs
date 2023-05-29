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

Factory.insert!(:recipes,
  uid: Ecto.UUID.generate(),
  title: "Mini Cheesecakes",
  description:
    "Want to make a small dessert that's going to be a hit? This mini cheesecake recipe is perfect - easy to make, and they won't last long!",
  ingredients: [
    "12 oz cream cheese, 1.5 packages",
    "1/2 cup granulated sugar",
    "2 egg(s)",
    "1/2 teaspoon vanilla extract",
    "1 cup graham cracker crumbs",
    "3 1/2 T butter, melted",
    "12 strawberries",
    "12 T whipped cream"
  ],
  instructions: [
    "Preheat oven to 350F.",
    "Add the cream cheese, eggs, vanilla and sugar in a large mixing bowl. Blend and set aside.",
    "Crush the graham crackers and mix with the melted butter.",
    "Press the crumbs into the pan, dividing equally between each cavity.",
    "Pour the cheesecake mixture right on top of the crumbs, until it's 3/4 full.",
    "Bake for about 30-32 minutes.",
    "Let stand to cool for 15-20 minutes, then refrigerate about one hour.",
    "Add fruit, whipped cream (1 T per cake), and anything else you like before serving."
  ],
  prep_time: "10 minutes",
  cook_time: "32 minutes",
  total_time: "42 minutes",
  tags: ["cheesecake", "dessert", "mini"]
)

Factory.insert!(:recipes,
  uid: Ecto.UUID.generate(),
  title: "Soft and Fluffy Japanese Milk Bread",
  description:
    "Try this milk bread recipe for the softest, fluffiest homemade milk bread! Also known as Japanese milk bread, Hokkaido milk bread, or shokupan.",
  ingredients: [
    "4 3/4 cups bread flour",
    "1 3/4 cups milk",
    "2 1/4 Tablespoons sugar",
    "1 2/3 Tablespoons butter",
    "2 teaspoons sea salt",
    "3 1/3 teaspoon active dry yeast",
    "2 1/4 teaspoon dough enhancer"
  ],
  instructions: [
    "Mix: Attach the dough hook to your stand mixer. Add all the ingredients except the butter. Mix on low until there's no more dry flour. Then add the butter and beat on high speed. The dough is ready when it forms into a ball and the surface is smooth and glossy. Check for proper gluten develop using the window pane test. Timing will vary but it took me 10 to 13 minutes.",
    "Proof: Form the dough into a smooth round ball and place into a see through proofing container that's been coated with oil. Proof until doubled in size in a warm, humid environment.",
    "Bench rest: On a well floured surface, divide the dough into 6 even pieces and roll each into a ball. Loosely cover and let it rest for 15 minutes.",
    "Shape: Roll each ball into an oval shape. Flip it over so the surface (crust) is on the bottom and do a letter fold (2 folds). Then roll it up to form a spiral and then pinch the seam closed. Place three spirals in each 1 lb loaf pan. Repeat for the other pieces.",
    "Final proof: Proof in a warm humid place until doubled in size or it's 1 cm below the rim of the loaf pan. Preheat your oven to 356° F.",
    "Bake: Bake at 356° F for 25 minutes or until it gets a golden brown crust. For a shiny, golden crust: Immediately after removing from the oven, brush on an egg wash coating for a shiny crust. Crack an egg in a small bowl and mix well. Using a pastry brush, apply a thin coating to the crust. The heat from the bread will cook the egg, giving you a shiny golden crust."
  ],
  prep_time: "1 hour 5 minutes",
  cook_time: "25 minutes",
  total_time: "1 hour 30 minutes",
  tags: ["bread", "milk", "fluffy"]
)
