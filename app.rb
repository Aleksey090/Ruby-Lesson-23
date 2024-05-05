require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	# @error = "Error"
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@color = params[:color]

		if @username == ''
			@error = 'Enter name'
		end

		if @phone == ''
			@error = 'Enter phone'
		end

		if @datetime == ''
			@error = 'Enter time'
		end

		if @error != ''
			return erb :visit
		end

			# -----REFACTORING-------
		# hh = { :username => 'Enter name',
				# :phone => 'Enter phone',
				# :datetime => 'Enter time' }
		
		# hh.each do |key, value|
			# if params[key] == ''
				# @error = [key]
				# return erb :visit
			# end
		# end


	erb "OK, your name: #{@username}, your phone: #{@phone}, date: #{@datetime} and your color: #{@color}"

end
