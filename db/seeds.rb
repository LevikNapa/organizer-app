# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: 'ralphy', email: 'ralphy@abc.com')
User.create(username: 'zago', email: 'zago@abc.com')
User.create(username: 'murf', email: 'murf@abc.com')


List.create(user_id: 1, title: "The New Dog")
List.create(user_id: 1, title: "Our Boat")
List.create(user_id: 1, title: "Dinner")

List.create(user_id: 2, title: "Burgers")
List.create(user_id: 2, title: "Ski Trip")
List.create(user_id: 2, title: "Dog Walk")

List.create(user_id: 3, title: "Attending the Ballet")
List.create(user_id: 3, title: "Using a Seed File")
List.create(user_id: 3, title: "Javascript is your friend")


ListItem.create(list_id: 1, content: 'I love all dogs.')
ListItem.create(list_id: 2, content: 'We have a good dog.')
ListItem.create(list_id: 3, content: 'I am a cat person.')
