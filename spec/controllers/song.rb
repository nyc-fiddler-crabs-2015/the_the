require File.expand_path '../../spec_helper.rb', __FILE__

describe 'Song' do
  let(:user){User.create(username: "rayanbouts", email: 'rayanbouts@gmail.com', password: "123")}
  let(:eminem){Artist.create(name: "Eminem", photo_url: "http://make-me-successful.com/wp-content/uploads/2013/08/shady.jpg")}
  let(:song){Song.create(title: "Lose Yourself", artist: eminem, url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/75095796&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true", is_top: true)}
  let(:lyric){Lyric.create(song: song, user: user, text: @loose_text)}

  it 'has its own profile' do
    eminem
    song
    lyric
    song.update_attributes(lyric: lyric)
    get "/songs/#{song.id}"
    expect(last_response).to be_ok
  end

  it 'has its name assigned to its profile' do
    eminem
    song
    lyric
    song.update_attributes(lyric: lyric)
    get "/songs/#{song.id}"
    expect(last_response.body).to include(song.title)
  end
end