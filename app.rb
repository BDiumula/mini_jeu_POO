require 'bundler'
Bundler.require
require "pry"

require_relative 'lib/player'
require_relative 'lib/game'

def perform
	player1 = Player.new("José") 
	player2 = Player.new("Alice")
		while player1.life_points > 0 && player2.life_points > 0
			puts "Voici l'état de chaque joueur : "
			puts "------------------------ \n\ "
			puts player1.show_state
			puts player2.show_state
			puts "Passons à la phase d'attaque :"
			print "------------------------ \n\ "
			player1.attacks(player2)
				if player2.life_points <= 0
					break
				else
					player2.attacks(player1)
				end
		end
	binding.pry
	puts "end of file"
end

perform