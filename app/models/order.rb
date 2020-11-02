class Order
	attr_reader :id, :meal, :customer
	def initialize(attributes = {})
		@id = attributes[:id]
		@meal = attributes[:meal_id]
		@customer = attributes[:customer_id]
		@employee = attributes[:employee_id]
		@delivered = attributes[:delivered] || false
	end
end