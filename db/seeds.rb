# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dinner.destroy_all
Recipe.destroy_all
Guest.destroy_all
User.destroy_all

#Users ---------------------------------------------------------------------
myriam = User.create! email: "mimi@mail.com", password: "testtest"
me = User.create! email: "me@mail.com", password: "testtest"

#Recipes ---------------------------------------------------------------------
burger = Recipe.create! name: "Burger", user: me, content: "- Lightly oil grill& heat BBQ to medium.
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
pecan_pie = Recipe.create! name: "Pecan Pie", user: me, content: "pecan nuts and caramel"
pizza = Recipe.create! name: "Pizza", user: myriam, content: "margharita"
tiramisu = Recipe.create! name: "Tiramisu", user: myriam, content: "coffee and mascarpone"

#Guests ---------------------------------------------------------------------
lionel = Guest.create! first_name: "Lionel", last_name: "Arnaud", user: me
helene = Guest.create! first_name: "Hélène", last_name: "Kuepper", user: me
mimi = Guest.create! first_name: "Myriam", last_name: "Bialobroda", user: myriam
karine = Guest.create! first_name: "Karine", last_name: "Bialobroda", user: myriam

#Dinners ---------------------------------------------------------------------
date = Date.new(2000,8,11)
date_2 = Date.new(2002,03,18)
date_3 = Date.new(2017,1,14)
Dinner.create! dinner_date: date, recipe: pizza, guest: lionel, user: me
Dinner.create! dinner_date: date_2, recipe: burger, guest: mimi, user: myriam
Dinner.create! dinner_date: date_3, recipe: tiramisu, guest: mimi, user: myriam
