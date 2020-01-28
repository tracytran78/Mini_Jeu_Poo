require "pry"

class Player
  attr_accessor :name, :life_points

  def initialize(player_name) 
    @name = player_name
    @life_points = 10
  end

  #cherche les points de dommages sur le joueur qui subit l'attaque via la méthode gets damage
  def attacks(player_name)
    puts "le joueur #{@name} attaque le joueur #{player_name.name}" 
    pts_damage = compute_damage 
    player_name.gets_damage(pts_damage) 
    puts "il lui inflige #{pts_damage} points de dommages"
  end

  #sort un chiffre (de dommage) entre 1 et 6 (chiffre entier)
  def compute_damage
     return rand(1..6) 
  end

  def gets_damage (pts_damage)
    @life_points -= pts_damage 
    return @life_points
  end

  def show_state
    if @life_points >= 0
      puts "#{@name} a #{@life_points} points de vie"
    else "le joueur #{@name} a été tué !"
    end
  end

end  #fin de ma classe Player

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize (player_name)
    @name = player_name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    if @life_points >= 0
      puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
    else "le joueur #{@name} a été tué !"
    end
  end

  def compute_damage
    rand(1..6) * @weapon_level 
  end

  #si l'utilisateur choisit de chercher une nouvelle arme, si ça puissance est supérieure a celle qu'il possède actuelle 
  def search_weapon 
    new_weapon_level = rand (1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}."
    
    if new_weapon_level > @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      @weapon_level = new_weapon_level
    else 
      #new_weapon_level == @weapon_level
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  #si l'utilisateur choisit de chercher un pack de vies
  def search_health_pack
    health_pack = rand(1..6) 

    if health_pack == 1
      puts "Tu n'as rien trouvé... "
    end

    if health_pack >= 2 && health_pack <= 5
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      if @life_points > 50
        @life_points = 100
      end
      if @life_points <=50
        @life_points + 50
      end
    end

    if health_pack == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      if @life_points > 20
        @life_points = 100
      end
      if @life_points <=20
        @life_points + 80
      end
    end
  end

end #fin de ma classe HumanPlayer