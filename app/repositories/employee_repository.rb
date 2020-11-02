require "csv"
require_relative "../models/employee"

class EmployeeRepository
	attr_reader :employee
  def initialize(csv_file)
  	@csv_file = csv_file
  	@employee = []
 	load_csv if File.exist?(@csv_file)
  end

  def find(id)
    @employee.find { |employee| employee.id == id }
  end

  def find_by_username(name)
  	@employee.find { |employee| employee.username == name }
  end

  private

	def load_csv
	    csv_options = { headers: :first_row, header_converters: :symbol }
	    CSV.foreach(@csv_file, csv_options) do |row|
	      row[:id] = row[:id].to_i
	      @employee << Employee.new(row)
	    end
	    # @next_id = @employee.last.id + 1 unless @employee.empty?
	  end
end