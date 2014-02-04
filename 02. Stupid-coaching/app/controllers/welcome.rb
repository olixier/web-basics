get '/' do
  @coach_message = params[:coach_message] || "what do you want kid ?"
  # Look in app/views/index.erb
  
  puts "self : #{self}"
  puts "self class: #{self.class}"
  puts "self instance variables from GET '/' route handler: #{self.instance_variables}"
  erb :index
end

post '/coach' do

  answer = params[:what]
  @coach_message = ""

  if answer.downcase.include? "i am going to work"
  	erb :congrats
  else
  	@coach_message += "I can feel your motivation son! " if answer == answer.upcase
  	if answer.include? "?"
  		@coach_message += "Silly question, just get dressed and go to work! What else?"
  	else
  		@coach_message += "Stupid, just get dressed and go to work! What else?"
  	end
  	erb :index
  end

end