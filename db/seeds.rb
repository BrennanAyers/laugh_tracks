# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
secret = Team.create(name: "Secret", age: 4, location: "Europe")
navi = Team.create(name: "Natus Vincere", age: 8, location: "Ukraine")

secret.players.create(name: "Puppey", winrate: 0.666)
secret.players.create(name: "MidOne", winrate: 0.681)
secret.players.create(name: "YapzOr", winrate: 0.676)
secret.players.create(name: "zai", winrate: 0.751)
secret.players.create(name: "Nisha", winrate: 0.758)

navi.players.create(name: "Chu", winrate: 0.521)
navi.players.create(name: "SoNNeikO", winrate: 0.517)
navi.players.create(name: "Crystallize", winrate: 0.506)
navi.players.create(name: "Blizzy", winrate: 0.524)
navi.players.create(name: "MagicaL", winrate: 0.522)
