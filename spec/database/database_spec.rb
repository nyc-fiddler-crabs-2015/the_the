require File.expand_path '../../spec_helper.rb', __FILE__
require_relative '../../db/lyric_template'
describe "Database" do
  let(:user){User.create(username: "rayanbouts", email: 'rayanbouts@gmail.com', password: "123")}
  let(:eminem){Artist.create(name: "Eminem", photo_url: "http://make-me-successful.com/wp-content/uploads/2013/08/shady.jpg")}
  let(:song){Song.create(title: "Lose Yourself", artist: eminem, url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/75095796&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true", is_top: true)}
  let(:lyric){Lyric.create(song: song, user: user, text: @loose_text)}

  it 'creates a user with a secure password' do
    user
    expect(user.id).not_to be(nil)
    expect(user.username).to eq("rayanbouts")
    expect(user.email).to eq("rayanbouts@gmail.com")
    expect(user.password_digest.length).to be > 8
  end

  it 'creates an artist' do
    eminem
    expect(eminem.id).not_to eq(nil)
    expect(eminem.name).to eq("Eminem")
  end

  it 'creates a song, that belongs to its artist' do
    song
    expect(song.id).not_to eq(nil)
    expect(song.artist).to be(eminem)
  end

  it 'creates a lyric to that specific song' do
    song
    lyric
    song.update_attributes(lyric: lyric)
    expect(song.lyric).to be(lyric)
  end

  it 'creates a lyric related to that song, without it being the default' do
    song
    lyric
    expect(lyric.song).to be(song)
    expect(song.lyric).to eq(nil)
  end

end




