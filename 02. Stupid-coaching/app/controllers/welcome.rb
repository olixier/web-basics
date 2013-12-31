get '/' do
  @coach_message = params[:coach_message] || "what do you want kid ?"
  # Look in app/views/index.erb
  puts "Context's instance variable from the GET '/' route : #{self.instance_variables}"
  erb :index
end

post '/coach' do
  puts "Context's instance variable from the POST '/coach' route : #{self.instance_variables}"
  
  "Implement your coach response ! params => #{params.inspect}"
end