require File.expand_path '../../spec_helper.rb', __FILE__
describe 'User' do
  let(:user){User.create(username: "rayanbouts", email: 'rayanbouts@gmail.com', password: "123")}

  it 'has a profile' do
    user
    get "/users/#{user.id}"
    expect(last_response).to be_ok
  end

  it 's profile has its name' do
    user
    get "/users/#{user.id}"
    expect(last_response.body).to include(user.username)
  end

end