# To fetch word translation, we need open-uri to make requests to the API + JSON for parsing the response.
require 'open-uri'
require 'json'

# You may need global variables to store general stats (number of games played, avg score,...)
# Here are some examples, you're free to use your own and add new ones !
# Note : you could have used class variables instead.
$nb_games = 0
$avg_score = 0
$length_record = 0
WORD_LENGTH = 9

class Game
  
	attr_accessor :answer, :time_start
	attr_reader :grid
  
  def initialize
    random_grid(WORD_LENGTH)
  end
  
  def points
  	self.translate_answer == 'nothing!' ? 0 : @answer.length
  end  
    
	def test_answer?
		begin
			test = @grid.dup
			@answer.upcase.each_char { |letter| test.delete_at(test.index(letter)) }
			@grid.length == test.length + @answer.length
		rescue
			return false
		end
	end

	def translate_answer
		begin
			h = JSON.parse(open("http://api.wordreference.com/affd4/json/enfr/" + @answer).read)
			h["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"]
		rescue
			return 'nothing!'
		end
	end

  private

	def random_grid(n)
		result = []
		n.times { result << ('A'..'Z').to_a[rand(26)]}
		@grid = result
	end

end