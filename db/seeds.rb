# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Recipe.destroy_all

Recipe.create! name: "Burger", content: "- Lightly oil grill& heat BBQ to medium.
- Whisk egg in a bowl& add next 6 ingredients.
- Add any of the “stir-ins” that appeal to you.
- Crumble in beef& using your hands or a fork, gently mix together.
- Handle the meat as little as possible – the more you work it, the tougher it gets.
- Gently shape (don’t firmly press) mixture into burgers about ¾ inch thick.
- Using your thumb, make a shallow depression in the centre of each burger to prevent puffing up during cooking.
- Place burgers on the grill, close lid& BBQ until NO LONGER PINK INSIDE, turning once, about 6 – 8 minutes per side.
- An instant read thermometer should read 160F.
- Don't abuse your burgers by pressing with a spatula, pricking with a fork or turning frequently as precious juices will be lost!
- Tuck into a warm crusty bun& add your favourite toppings."
Recipe.create! name: "Pizza", content: "margharita"
