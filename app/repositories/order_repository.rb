require "csv"
require_relative "../models/order"

class OrderRepository
	attr_reader :orders
	def initialize(csv_file, meal_repo, customer_repo, employee_repo)
		@csv_file = csv_file
		@meal_repo = meal_repo
		@customer_repo = customer_repo
		@employee_repo = employee_repo
		@orders = []
		load_csv if File.exist?(@csv_file)
	end

	private

	def load_csv
	    csv_options = { headers: :first_row, header_converters: :symbol }
	    CSV.foreach(@csv_file, csv_options) do |row| # row = { :id => 1, :delivered => false , :meal_id => 1, :meal => {hbeflef}}	
	      row[:id] = row[:id].to_i
	      row[:delivered] = row[:delivered] == "true"
	      row[:meal] = @meal_repo.find(row[:meal_id])
	      row[:customer] = @customer_repo.find(row[:customer_id])
	      row[:employee] = @employee_repo.find(row[:employee_id])
	      @orders << Order.new(row)
	      # customer = @customer_repo.find(row[:customer_id])
	      # meal = @meal_repo.find(row[:meal_id])
	      # @orders << Order.new(meal_id: meal, customer_id: customer)
	    end
	    @next_id = @orders.last.id + 1 unless @orders.empty?
    end

end