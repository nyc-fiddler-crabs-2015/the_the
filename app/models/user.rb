class User
  attr_reader :name, :password

  def initialize(args)
    @name = args[:name]
    @password = args[:password]
  end
end