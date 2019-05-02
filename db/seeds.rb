# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
secret = Team.create!(name: "Secret", age: 4, location: "Europe", image: "https://steamcdn-a.akamaihd.net/apps/dota2/images/team_logos/1838315.png")
navi = Team.create!(name: "Natus Vincere", age: 8, location: "Ukraine", image: "https://steamcdn-a.akamaihd.net/apps/dota2/images/team_logos/36.png")

secret.players.create!(name: "Puppey", winrate: 0.666, image: "https://www.opendota.com/assets/images/dota2/players/87278757.png")
secret.players.create!(name: "MidOne", winrate: 0.681, image: "https://www.opendota.com/assets/images/dota2/players/116585378.png")
secret.players.create!(name: "YapzOr", winrate: 0.676, image: "https://www.opendota.com/assets/images/dota2/players/89117038.png")
secret.players.create!(name: "zai", winrate: 0.751, image: "https://www.opendota.com/assets/images/dota2/players/73562326.png")
secret.players.create!(name: "Nisha", winrate: 0.758, image: "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/6d/6d7afedeb7362ba8a2ed0b0ca6cabb63b15fab80_full.jpg")

navi.players.create!(name: "Chu", winrate: 0.521, image: "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/7c/7c590378e43123beebb838e2987eb6773febe1a6_full.jpg")
navi.players.create!(name: "SoNNeikO", winrate: 0.517, image: "https://www.opendota.com/assets/images/dota2/players/117421467.png")
navi.players.create!(name: "Crystallize", winrate: 0.506, image: "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/30/30e0a06d7dd24bb7ee8d79eb7ca212079c48273d_full.jpg")
navi.players.create!(name: "Blizzy", winrate: 0.524, image: "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/fb/fb9c36c36e54b8ca5f2e1cbd89c06574d1348af0_full.jpg")
navi.players.create!(name: "MagicaL", winrate: 0.522, image: "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/b0/b06d64c8e6a235d70b0c78f5112cd18156f16b96_full.jpg")
