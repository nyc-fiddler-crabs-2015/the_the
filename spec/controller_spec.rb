require File.expand_path '../spec_helper.rb', __FILE__

describe "My app" do
  let(:user) {User.new({name: "Rayan", password: "Notyourbusiness"})}
  before(:each) do
    user
  end

  it "should allow us to go to the index page" do
    get '/'
    last_response.should be_ok
    expect(last_response.body).to include('Welcome to my LightSaber')
  end
  it "should let you go to a user page" do
    get "/users/#{user.name}"
    expect(last_response).to be_ok
    expect(last_response.body).to include("<h1>#{user.name}</h1>")

  end

end