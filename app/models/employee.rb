class Employee
	attr_reader :username, :password, :id
  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password ]
    @role = attributes[:role]
  end


end