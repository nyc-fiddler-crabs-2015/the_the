require_relative '../spec/lyric_template'
user = User.create(username: "rayanbouts", email: 'rayanbouts@gmail.com', password: "123")
eminem = Artist.create(name: "Eminem", photo_url: "http://make-me-successful.com/wp-content/uploads/2013/08/shady.jpg")
other_song= Song.create(title: "Lose Your Spaghettis", url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/75095796&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true", is_top: true)
song = Song.create(title: 'Lose yourself', url:"https://www.youtube.com/embed/WloBl0Yq8UM", artist: eminem)
lyric= Lyric.create(song: song, user: user, text: @loose_text)
vote= Vote.create(lyric: lyric, user: user)

song.update_attributes(lyric: lyric)


hey= Song.create(title: "Ice ice baby", artist: eminem, url:"https://www.youtube.com/embed/5W8hTL2xb7w")

lyric = Lyric.create(song: hey, user: user, text: @ice_text)
hey.update_attributes(lyric: lyric)
