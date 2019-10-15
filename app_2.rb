require 'bundler'
Bundler.require
require 'pry'

require_relative './lib/game'
require_relative './lib/player'

 # debut de jeu
puts "-" * 50
puts " BIENVENUE SUR JEU '~ ILS VEULENT TOUS MA POO ~'! "
puts "--> Le but de jeu est d'être le dernier survivant ! "
puts " ******* Bonne chance :) ******** "
puts "-" * 50

# utilisateur 
puts "Choisis ton pseudo : " 
print "> "
n = gets.chomp
human = HumanPlayer.new(n)
puts "Tu es prêt ? "
puts "- " * 20
# on va creer nos combattants
	opps = []
	puts "Voila tes enemis :"
	player1 = Player.new("Josiane")
	player2 = Player.new("José")
	player1.show_state
	player2.show_state
    opps << player1 
    opps << player2
# commbat
while human.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
		human.show_state

  # utilisateur doit chosir
  puts "-" * 20
  puts "Quelle action veux-tu effectuer ? "
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts "attaquer un joueur en vue :"
  if player1.life_points > 0 # seulement si p1 ou p2 sont en vie
    print "0 - "
    player1.show_state
  end
  if player2.life_points > 0
    print "1 - "
    player2.show_state
  end
 puts "ton choix ?"
 print "> "
 action = gets.chomp 
 puts "-" * 20

  # action doit etre egal a s 0 1
 if !(action == "a" || action == "s" || action == "0" || action == "1")
	puts "NOP ! Choisis une entrée entre a, b, 0 ou 1 !"
	action = gets.chomp
	print "> "
end
  if action == "a"
    human.search_weapon
  end
  if action == "s"
    human.search_health_pack
  end
  if action == "0" && player1.life_points > 0
    human.attacks(player1)
  end
  if action == "1" && player2.life_points > 0
    human.attacks(player2)
 end

  # p1, p2 attaque human
  if player1.life_points > 0 && player2.life_points > 0
     puts "Les autres joueurs t'attaquent !"
  end
  opps.each do |opp|
    if opp.life_points > 0
      opp.attacks(human)
    end
  end

end

# fin 
puts "**" * 15
if human.life_points > 0
  puts "BRAVO !!! TU AS GAGNE  :) !"
else
  puts "Ummm...tu as perdu .. :( !"
end






#binding.pry