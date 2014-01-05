get '/' do
  @coach_message = params[:coach_message] || "what do you want kid ?"
  # Look in app/views/index.erb
  
  puts "self : #{self}"
  puts "self class: #{self.class}"
  puts "self instance variables from GET '/' route handler: #{self.instance_variables}"
  erb :index
end

post '/coach' do
  puts "self instance variable from POST '/coach' route handler: #{self.instance_variables}"
  
  "Implement your coach response ! params => #{params.inspect}"
end