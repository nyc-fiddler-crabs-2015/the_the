# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require_relative 'lyric_template'


user = User.create(username: "rayanbouts", email: 'rayanbouts@gmail.com', password: "123")
other_song= Song.create(title: "Lose Your Spaghettis", url: "https://www.youtube.com/embed/SW-BU6keEUw", is_top: true)
song = Song.create(title: 'Lose yourself', url:"https://www.youtube.com/embed/WloBl0Yq8UM")
lyric= Lyric.create(song_id: song.id, user_id: user.id, text: @loose_text)

song.update_attributes(lyric_id: lyric.id)


hey= Song.create(title: "Ice ice baby", url:"https://www.youtube.com/embed/5W8hTL2xb7w")

lyric_two = Lyric.create(song_id: hey.id, user_id: user.id, text: @ice_text)
hey.update_attributes(lyric_id: lyric_two.id)
