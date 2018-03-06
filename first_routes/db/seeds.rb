# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  { username: "nickolass" },
  { username: "mattilicious" },
  { username: "steven" }
  ])

artworks = Artwork.create([
  { title: "mona lisa", artist_id: 1 },
  { title: "the one who walks", artist_id: 2 },
  { title: "the third artwork", artist_id: 3 }
  ])

artwork_shares = ArtworkShare.create([
  { artwork_id: 1, viewer_id: 2 },
  { artwork_id: 2, viewer_id: 3 },
  { artwork_id: 3, viewer_id: 1 }
  ])

comments = Comment.create([
  { user_id: 3, body: "hi this was good", artwork_id: 1 },
  { user_id: 2, body: "wow that sucked", artwork_id: 3 },
  { user_id: 1, body: "I don't know what to think of this,", artwork_id: 2 }
  ])
