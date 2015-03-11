require File.expand_path '../spec_helper.rb', __FILE__
lyric_text = "
Look, if you had one shot, or one opportunity<br>
To seize everything you ever wanted. one moment<br>
Would you capture it or just let it slip?<br>
Yo<br>
<br>
His palms are sweaty, knees weak, arms are heavy<br>
There's vomit on his sweater already, mom's spaghetti<br>
He's nervous, but on the surface he looks calm and ready to drop bombs,<br>
But he keeps on forgetting what he wrote down,<br>
The whole crowd goes so loud<br>
He opens his mouth, but the words won't come out<br>
He's choking how, everybody's joking now<br>
The clock's run out, time's up, over, bloah!<br>
Snap back to reality, Oh there goes gravity<br>
Oh, there goes Rabbit, he choked<br>
He's so mad, but he won't give up that<br>
Easy, no<br>
He won't have it, he knows his whole back's to these ropes<br>
It don't matter, he's dope<br>
He knows that but he's broke<br>
He's so stagnant, he knows<br>
When he goes back to his mobile home, that's when it's<br>
Back to the lab again, yo<br>
This whole rhapsody<br>
He better go capture this moment and hope it don't pass him<br>
<br>
<i>[Hook:]</i><br>
You better lose yourself in the music, the moment<br>
You own it, you better never let it go<br>
You only get one shot, do not miss your chance to blow<br>
This opportunity comes once in a lifetime yo<br>
You better lose yourself in the music, the moment<br>
You own it, you better never let it go<br>
You only get one shot, do not miss your chance to blow<br>
This opportunity comes once in a lifetime yo<br>
(You better)<br>
<br>
The soul's escaping, through this hole that is gaping<br>
This world is mine for the taking<br>
Make me king, as we move toward a new world order<br>
A normal life is boring, but superstardom's close to post mortem<br>
It only grows harder, homie grows hotter<br>
He blows. It's all over. These hoes is all on him<br>
Coast to coast shows, he's known as the globetrotter<br>
Lonely roads, God only knows<br>
He's grown farther from home, he's no father<br>
He goes home and barely knows his own daughter<br>
But hold your nose 'cause here goes the cold water<br>
His hoes don't want him no more, he's cold product<br>
They moved on to the next schmoe who flows<br>
He nose dove and sold nada<br>
So the soap opera is told and unfolds<br>
I suppose it's old partner but the beat goes on<br>
Da da dum da dum da da<br>
<br>
<i>[Hook]</i><br>
<br>
No more games, I'ma change what you call rage<br>
Tear this motherfucking roof off like two dogs caged<br>
I was playing in the beginning, the mood all changed<br>
I've been chewed up and spit out and booed off stage<br>
But I kept rhyming and stepped right into the next cypher<br>
Best believe somebody's paying the pied piper<br>
All the pain inside amplified by the fact<br>
That I can't get by with my 9 to 5<br>
And I can't provide the right type of life for my family<br>
Cause man, these goddamn food stamps don't buy diapers<br>
And it's no movie, there's no Mekhi Phifer, this is my life<br>
And these times are so hard, and it's getting even harder<br>
Trying to feed and water my seed, plus<br>
Teeter totter caught up between being a father and a prima donna<br>
Baby mama drama's screaming on and<br>
Too much for me to wanna<br>
Stay in one spot, another day of monotony<br>
Has gotten me to the point, I'm like a snail<br>
I've got to formulate a plot or I end up in jail or shot<br>
Success is my only motherfucking option, failure's not<br>
Mom, I love you, but this trailer's got to go<br>
I cannot grow old in Salem's lot<br>
So here I go it's my shot.<br>
Feet, fail me not, this may be the only opportunity that I got<br>
<br>
<i>[Hook]</i><br>
<br>
You can do anything you set your mind to, man
"


describe "Database" do
  let(:user){User.create(username: "rayanbouts", email: 'rayanbouts@gmail.com', password: "123")}
  let(:eminem){Artist.create(name: "Eminem", photo_url: "http://make-me-successful.com/wp-content/uploads/2013/08/shady.jpg")}
  let(:song){Song.create(title: "Lose Yourself", artist: eminem, url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/75095796&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true")}
  let(:lyric){Lyric.create(song: song, user: user, text: lyric_text)}
  let(:vote){Vote.create(lyric: lyric, user: user)}

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

  it 'creates a vote to a lyric' do
    vote
    expect(vote.lyric).to be(lyric)
    expect(vote.user).to be(user)
  end
end




