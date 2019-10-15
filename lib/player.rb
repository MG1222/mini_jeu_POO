require 'pry'

# ---PLAYER---
class Player
	attr_accessor :names, :life_points


	def initialize(names)
		@names = names
		@life_points = 10
	end

	def show_state
		puts "#{@names} a #{@life_points} points de vie"
	end	

	def gets_domage(damage)
		@life_points = @life_points - damage
		if @life_points <= 0 
			puts "#{names} a ete tue :( "
		end
	end

	def attacks(player)
		puts "Le joueur #{names} attaque le joueur #{player.names}"
		damage = compute_damage
		#puts @life_points
		puts " ! Il lui infilege #{damage} points de dommages ! "
		player.gets_domage(damage) #on appele methode gets.domage(damage) a player
	end
	
	def compute_damage
		return rand(1..6)
	end	
end	
 
# ---HUMANPLAYER---
class HumanPlayer < Player # herite
	attr_accessor :weapon_level

	def initialize(names)
		@names = names
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		puts " #{@names} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end

	def compute_damage
		rand(1..6) * @weapon_level
	end

	def search_weapon
	  	weapon_level = rand(1..6) 
   		puts "Tu as trouvé une arme de niveau #{weapon_level}"
   	if weapon_level > @weapon_level
     	@weapon_level = weapon_level
     	puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
   else
     puts "F*@?! !! elle n'est pas mieux que ton arme actuelle..."
   end
end

def search_health_pack
  health = rand(1..6)
  if health == 1 
  	puts "Tu n'as rien trouvé.. :( "
  end
  if health == 2 && health == 5
  	puts "BRAVO ! Tu as truve un pack de +50 points de la vie :) "
  else health == 6
  	puts "WOAW ! Tu as truve un pack de +80 points de la vie :) "
  end
end



end	






