require 'pry'

class Player
    attr_accessor :name, :life_points #on définit une variable d'instance lisible et modifiable

    def initialize(name_player)
        @name = name_player
        @life_points = 10
    end 
#Méthode qui permet de savoir combien de points a un joueur 
    def show_state
        puts "#{name} a #{life_points} points"
        return 
    end
#Après déduction de points, affiche le reste de points (si 0=joueur tué)
    def gets_damage(damage)
        @life_points = @life_points - damage 
        if life_points <= 0
          puts "Le joueur #{name} à été tué !"
        end
    end 
#Annonce qui attaque qui
    def attacks(name_player)
        puts"le joueur #{name} attaque le joueur #{name_player.name}"
        damage = compute_damage
        puts "#{name} inflige #{damage} points de dommages à #{name_player.name}"
        name_player.gets_damage(damage)
    end
#Dé (pour savoir player1 inflige x dommages)
    def compute_damage
        return rand(1..6)
        
      end
end

class HumanPlayer < Player
    attr_accessor :weapon_level #on définit une variable d'instance lisible et modifiable

    def initialize(name_player)
        @name = name_player
        @life_point = 100
        @weapon_level = 1
    end

    def show_state
        if life_points > 0
        puts "#{name} a #{@life_points} point de vie et une arme de niveau #{@weapon_level}"
        end
    end

    def compute_damage
        rand(1..6) * @weapon_level
      end
    #Lancer de dé, si le dé a un niveau supérieur a notre arme alors on la garde sinon on ne la récupére pas 
    def search_weapon 
        de = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{de}"
        if de > @weapon_level
            @weapon_level << de
            puts "Tu as trouvé une meilleure arme, gardes la bougre"
        else
           puts "#•@@& elle n'est pas meilleure que celle que j'ai deja"
        end
    end

    #Si health est égale à 1, alors nous avons rien trouver
    #Si health supérieur ou égale à 2, inférieur ou égale à 5 alors je gagne 50 points 
    #Si health est égal à 6 alors je gagne 80 points 
    #Le MAX de point est égale à 100 
    def search_health_pack
        health = rand(1..6)
        if health == 1
            puts "Tu n'as rien trouvé....dommage"
        elsif health >= 2 || health <= 5
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            @life_points += 50
        elsif health == 6
                puts "Bravo, tu as trouvé un pack de +80 points de vie !"
                @life_points += 80
        end
        if @life_points > 100
            @life_points = 100
        end
    end

end
	 

binding.pry