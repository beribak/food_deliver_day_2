class SessionsView

	def ask_user(something)
		puts "Please enter your #{something}"
		print "-----"
		return gets.chomp
	end

	def error
		puts "Username doesent exist or you typed a wrong password."
	end
end