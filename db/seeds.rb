# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Image.delete_all
Image.reset_pk_sequence
Image.create([
               { name: 'Default pic', file: 'default.png', theme_id: 1 },
               {name: 'pizza-1', file: 'pizza-1.jpg', theme_id: 2},
               {name: 'pizza-2', file: 'pizza-2.jpg', theme_id: 2},
               {name: 'pizza-3', file: 'pizza-3.jpg', theme_id: 2},
               {name: 'pizza-4', file: 'pizza-4.jpg', theme_id: 2},
               {name: 'pizza-5', file: 'pizza-5.jpg', theme_id: 2},
               {name: 'pizza-6', file: 'pizza-6.jpg', theme_id: 2},
               {name: 'pizza-7', file: 'pizza-7.jpg', theme_id: 2},
               {name: 'duck-1', file: 'duck-1.jpg', theme_id: 3},
               {name: 'duck-2', file: 'duck-2.jpg', theme_id: 3},
               {name: 'duck-3', file: 'duck-3.jpg', theme_id: 3},
               {name: 'duck-4', file: 'duck-4.jpg', theme_id: 3},
               {name: 'duck-5', file: 'duck-5.jpg', theme_id: 3},
               {name: 'duck-6', file: 'duck-6.jpg', theme_id: 3},
               {name: 'duck-7', file: 'duck-7.jpg', theme_id: 3},
             ])

Theme.delete_all
Theme.reset_pk_sequence
Theme.create([
               {name: "-----"},      # 1 Нет темы\
               {name: "Pizza"},      # 2
               {name: "Ducks?"},      # 3
             ])

User.delete_all
User.reset_pk_sequence
User.create([
              {name: "Example User", email: "example@railstutorial.org" }
            ])
