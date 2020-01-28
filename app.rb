# lignes très pratiques qui rendent les gems du Gemfile disponibles dans tous les fichiers. 
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/player.rb et lib/game.rb
require_relative 'lib/player'
#require_relative 'lib/game'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "Voici l'état de chaque joueur :"
player1.show_state
player2.show_state
puts ""

#le programme tourne tant que les joueurs ont des points de vie positifs
while player1.life_points > 0 && player2.life_points > 0 
  puts""
  puts"-----------------Phase d'ataque-----------------"
  puts""
  puts "Passons à la phase d'attaque :"
  player1.attacks(player2)
  player2.attacks(player1)
  
  puts""
  puts"-----------------Etat des joueurs-----------------"
  puts""
  puts "Voici l'état de chaque joueur :"
  player1.show_state
  player2.show_state

  #le programme s'arrête si l'un des joueurs n'a plus de points de vie
  if player1.life_points <0 || player2.life_points <0 
    break
  end  
end

if player1.life_points <= 0 
  puts "Le joueur #{player1.name} a été tué!"
end
if player2.life_points <= 0 
    puts "Le joueur #{player2.name} a été tué!"
end  

# ligne qui permet d'effectuer des tests dans le terminal (avec PRY)
binding.pry

