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

				# -----REFACTORING 01-------
		# if @username == ''
		# 	@error = 'Enter name'
		# end

		# if @phone == ''
		# 	@error = 'Enter phone'
		# end

		# if @datetime == ''
		# 	@error = 'Enter time'
		# end

		# if @error != ''
		# 	return erb :visit
		# end

				# -----REFACTORING 02-------
		hh = { :username => 'Enter name',
				:phone => 'Enter phone',
				:datetime => 'Enter time' }
		
			@error = hh.select {|key,_| params[key] == ''}.values.join(' & ')

				if @error != ''
					return erb :visit
				end

				# -----REFACTORING 03-------
		# hh.each do |key, value|
		# 	if params[key] == ''
		# 		@error = [value]
		# 		return erb :visit
		# 	end
		# end



	erb "OK, your name: #{@username}, your phone: #{@phone}, date: #{@datetime} and your color: #{@color}"

end

