# lignes très pratiques qui rendent les gems du Gemfile disponibles dans tous les fichiers. 
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/player.rb et lib/game.rb
require_relative 'lib/player'
#require_relative 'lib/game'

 
puts " ---------------------------------------------------------
|     Bienvenue sur 'ILS VEULENT TOUS MA POO' !           |
|     Le but du jeu est d'être le dernier survivant !     |
|                    Fight!                               |
 ---------------------------------------------------------"
 
puts ""
puts "Bonjour, veuillez entrer votre nom de joueur"
print " > "

#l'utilisateur doit créer son player en le nommant
user = HumanPlayer.new (gets.chomp)  
player2 = Player.new("Josiane")
player3 = Player.new("José")
enemies = [player2, player3]
 
#le programme tourne tant que les points de vie du joueur ou celle des deux ennemies sont positifs
while user.life_points >0 && (player2.life_points > 0 || player3.life_points >0) 
  
  
  puts ""
  puts "Quelle action veux-tu effectuer ?"
  puts ""
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts "ou"
  puts "attaquer un joueur en vue :"
  puts "0 - #{player2.name} a #{player2.life_points} points de vie"
  puts "1 - #{player3.name} a #{player3.life_points} points de vie"
  print " > "
  response = gets.chomp
  puts ""


  if response == "a"
    user.search_weapon
  elsif response == "s"
    user.search_health_pack
  elsif response == "0"
    user.attacks(player2)
  elsif response == "1"
    user.attacks(player3)
  end

  puts "Les autres joueurs t'attaquent !"

  #Evalue les points de vie de chacun des ennemies, tant qu'ils ont encore des vies, ils peuvent continuer d'attaquer l'utilisateur
  enemies.each do |player| 
    if player.life_points >= 0
      player.attacks(user)
    end
  end

  puts ""
  puts "Voici l'état de chaque joueur :"
  user.show_state
  player2.show_state
  player3.show_state
  puts ""
  
  #le programme s'arrête si l'utilisateur n'a plus de point de vies ou si les deux ennemies ont été tués
  if user.life_points <0 || (player2.life_points <0 && player3.life_points <0) 
    break
  end  
end

#à la fin de la boucle si l'utilisateurs a encore des vies, la partie est gagnée, autrement celà veut dire que les ennemies ont tué l'utilisateur!
if user.life_points >0 
  puts "La partie est finie"
  puts "BRAVO ! TU AS GAGNE !" 
else 
  puts "Loser ! Tu as perdu !"
end

# ligne qui permet d'effectuer des tests dans le terminal (avec PRY)
binding.pry