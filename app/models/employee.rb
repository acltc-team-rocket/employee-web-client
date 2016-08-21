class Employee

  attr_accessor :id, :first_name, :last_name, :email, :birthdate, :ssn 

  def initialize(hash)
    @id = hash['id']
    @first_name = hash['first_name']
    @last_name = hash['last_name']
    @email = hash['email']
    @birthdate = hash['birthdate']
    @ssn = hash['ssn']
  end


end