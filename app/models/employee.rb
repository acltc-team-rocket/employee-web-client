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

  def self.find(id)
    employee_hash = Unirest.get("#{ENV['DOMAIN']}/employees/#{id}.json", headers: {"X-User-Email" => ENV['API_EMAIL'], "Authorization" => "Token token=#{ENV['API_KEY']}"}).body
    return Employee.new(employee_hash)
  end

  def self.all
    employee_hashes = Unirest.get("#{ENV['DOMAIN']}/employees.json", headers: {"X-User-Email" => ENV['API_EMAIL'], "Authorization" => "Token token=#{ENV['API_KEY']}"}).body
    employees = []
    employee_hashes.each do |employee_hash|
      employees << Employee.new(employee_hash)
    end
    return employees
  end

  def self.create(attributes)
    employee_hash = Unirest.post("#{ENV['DOMAIN']}/employees.json", parameters: attributes, headers: {"X-User-Email" => ENV['API_EMAIL'], "Authorization" => "Token token=#{ENV['API_KEY']}"}).body
    return Employee.new(employee_hash)
  end

  def destroy
    Unirest.delete("#{ENV['DOMAIN']}/employees/#{id}.json", headers: {"X-User-Email" => ENV['API_EMAIL'], "Authorization" => "Token token=#{ENV['API_KEY']}"}).body
  end


end