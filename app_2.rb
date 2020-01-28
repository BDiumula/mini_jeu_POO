require 'bundler'
Bundler.require
require "pry"

require_relative 'lib/player'
require_relative 'lib/game'

#Accueil
puts "------------------------------------------------ "
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO         |'"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------ "

#Initialisation du joueur
puts "Entrez le nom du joueur"
print "> " 
@name = gets.chomp
puts "Bienvenue #{@name} !\n\ "
user = HumanPlayer.new(@name)

#Initialisation des ennemis
ennemis_array =[ ]
ennemis_array << player1 = Player.new("José") 
ennemis_array << player2 = Player.new("Josianne")

#Le combat
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
	puts "Voici ton état : "
	puts user.show_state

	puts "Quelle action veux-tu effectuer ? \n\ "
	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner \n\ "
	puts "Attaquer un joueur en vue : "
	print "0 - "
	print player1.show_state
	print "1 - " 
	print player2.show_state 
	print "> " 
	user_answer = gets.chomp
	puts " \n\ "
	case user_answer
		when "a"
			user.search_weapon
		when "s"
			user.search_health_pack
		when "0"
			user.attacks(player1)
		when "1"
			user.attacks(player2)
		else 
			nil
		end
	puts "   OHHH NOOOONNNNN !!!!! \n\ "
	puts "Les autres joueurs t'attaquent !\n\ "
	ennemis_array.each do |ennemis|
		if ennemis.life_points > 0
		ennemis.attacks(user)
		end
	end	
	puts "---------------------------------------------- \n\ "
end

#Fin du jeu
puts "La partie est finie"
	if user.life_points > 0
		puts "BRAVO ! TU AS GAGNE !"
	else
		puts "Loser ! Tu as perdu !"
	end


binding.pry
puts "end of file"

