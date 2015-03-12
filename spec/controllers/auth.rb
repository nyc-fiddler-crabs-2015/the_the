require File.expand_path '../../spec_helper.rb', __FILE__

describe 'authentication' do

  let(:user){User.create(username: "rayanbouts", email: 'rayanbouts@gmail.com', password: "123")}
  before do
    user
  end

  it 'renders an index page' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Login")
    expect(last_response.body).to include("Signup")
  end


  it 'logs you in ' do
    post '/login', params={username: 'rayanbouts', password: '123'}
    expect(last_response).to be_ok
  end

  it 'doesnt log you in if passwords dont match' do
    user
    post '/login', params={username: 'rayanbouts', password: '122'}
    expect(last_response).not_to be_ok
  end

  it 'signs you up' do
    post '/signup', params={username: 'rayanbout',email: "rayanbout@gmail.com", password: '123', password_confirmation: '123'}
    expect(last_response).to be_ok
  end

end
