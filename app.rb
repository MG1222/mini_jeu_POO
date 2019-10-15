require 'bundler'
Bundler.require
require 'pry'

require_relative './lib/game'
require_relative './lib/player'



player1 = Player.new("Josiane")
player2 = Player.new("José")
while player1.life_points > 0 && player2.life_points > 0
puts "Voici l'etat de nos joueurs : "
player1.show_state
player2.show_state
puts "-" * 20
puts "Passon à la phase d'attaque : "
player1.attacks(player2)
player2.attacks(player1)

if player1.life_points <= 0 || player2.life_points <= 0
 		break 
 	end
end	


