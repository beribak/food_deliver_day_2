require_relative "meal_repository"
require_relative "customer_repository"
require_relative "employee_repository"
require_relative "order_repository"
# require_relative "router"


MEALS_CSV_FILE = File.join(__dir__, "../../data/meals.csv")
CUSTOMERS_CSV_FILE = File.join(__dir__, "../../data/customers.csv")
EMPLOYEES_CSV_FILE = File.join(__dir__, "../../data/employee.csv")

meal_repository = MealRepository.new(MEALS_CSV_FILE)

customer_repository = CustomerRepository.new(CUSTOMERS_CSV_FILE)

employee_repository = EmployeeRepository.new(EMPLOYEES_CSV_FILE)


ORDER_CSV_FILE = File.join(__dir__, "../../data/order.csv")
t = OrderRepository.new(ORDER_CSV_FILE, meal_repository, customer_repository, employee_repository)

puts t.orders

t.orders.each do |item|
 puts "aefaf"
 puts item.id
 puts item.customer
 puts item.meal
end

