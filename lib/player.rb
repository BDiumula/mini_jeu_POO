class Player
		attr_accessor :name , :life_points, :damages
#attributs
		def initialize(name_to_save)
			@life_points = 10
			@name = name_to_save
		end
#afficher l'état d'un joueur
		def show_state
			puts "#{@name} a #{@life_points} points de vie"
		end
#subir une attaque
		def gets_damage(damages_to_save)
			@damages = damages_to_save.to_i
			@life_points = @life_points - @damages
			if @life_points <= 0
				puts "#{@name} a été tué! :( \n\ "
			end
		end
#attaquer
		def attacks(victime)
			puts "#{@name} attaque #{victime.name}"
			number_damages = compute_damage
			puts "Le joueur lui inflige #{number_damages} points de dommages \n\ "
			victime.gets_damage(number_damages)
		end
#définir un nombre de damage aléatoire
		 def compute_damage
    		return rand(1..6)
  		end

end
#définition d'un joueur humain
class HumanPlayer < Player
		attr_accessor :weapon_level

		def initialize(name_to_save)
			super(name_to_save)
			@life_points = 100
			@weapon_level = 1
		end

		def show_state
			puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
		end
#augmenter les dommages causés
		def compute_damage
    		rand(1..6) * @weapon_level
  		end
#chercher une nouvelle arme
  		def search_weapon
  			 new_weapon = rand(1..6)
  			 puts "Tu as trouvé une arme de niveau #{new_weapon} !"
  			 if new_weapon > @weapon_level
  			 	@weapon_level = new_weapon
  			 	puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
  			 else
  			 	puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
  			 end
  		end
#chercher un pack de points de vie
  		def search_health_pack
  			rand(1..6)
  			result = rand(1..6)
  			if result == 1
  			 	puts "Tu n'as rien trouvé... "

	  		elsif result.between?(2,5)
	  			unless @life_points < 100
	  				@life_points = @life_points+50 
	  				puts "Bravo, tu as trouvé un pack de +50 points de vie !"
	  			else 
	  				puts "Désolé tu as déjà plein de vies"
	  			end
	  		else 
	  			unless @life_points < 100
		  			@life_points = @life_points+80
			  		puts "Waow, tu as trouvé un pack de +80 points de vie !"
			  	else 
	  				puts "Désolé tu as déjà pleins de vies"
		  		end
	  		end
	  	end
end
 
