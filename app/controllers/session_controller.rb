require_relative "../views/sessions_view"

class SessionsController
	def initialize(employee_repository)
		@employee_repository = employee_repository 
		@view = SessionsView.new
	end

	def login
		username = @view.ask_user("username")
		password = @view.ask_user("password")
		employee = @employee_repository.find_by_username(username)

		return employee if employee && employee.password == password
		
		@view.error
		login
	end

end