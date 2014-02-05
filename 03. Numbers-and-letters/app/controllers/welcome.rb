get '/' do
	@game = Game.new
	@game.time_start = Time.now
	session[:new_entry] = @game
  erb :index
end

post '/guess' do
	@last_game = session[:new_entry]
	@last_game.answer = params[:guess]


	if @last_game.test_answer?
		translation = @last_game.translate_answer
		points = @last_game.points
		time = Time.now - @last_game.time_start
		@message = "Your word means #{translation}, you earned #{points} points in #{time} seconds!"
		$avg_score = ($avg_score * $nb_games + points).to_f / ($nb_games + 1)
		$nb_games += 1
		$length_record = points if points > $length_record

	else
		@message = "This is not a valid answer, try again!"
	end

	@game = Game.new
	@game.time_start = Time.now
	session[:new_entry] = @game

  erb :index
end
