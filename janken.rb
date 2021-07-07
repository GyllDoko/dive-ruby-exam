class Player
    def hand
      # プレイヤーにじゃんけんの手を選択させる文章を表示させます。
      puts "Veuillez saisir un nombre."
      puts "0: Goo"
      puts "1: Choki"
      puts "2: Par"
  
      # 変数「input_hand」にプレイヤーの入力値を代入します。
      # ヒント：getsメソッドについて調べてみましょう。
      input_hand = gets.chomp
      # 「input_hand」が「0, 1, 2」のいずれかだと繰り返し処理を終了し、それ以外（アルファベットも含む）だと繰り返し処理を継続します。
      
      
      while true
        if "abcdefghijklmnopqrstuvwxyz".include?(input_hand)
          puts "les caractères ne sont pas authorisés"
          input_hand = gets
        end
        if "3456789".include?(input_hand)
          puts "Veuillez saisir un nombre en 0 et 2"
          input_hand = gets
        end
          [0,1,2].each do |x|
          if x == input_hand.to_i
            return input_hand.to_i
            break
        end
      end
        end      
      end
  end

  class Enemy
    def hand 
      return rand(0..2)
    end
  end
  # プレイヤー(自分)が入力した「0~2」と、敵がランダムで生成した「0~2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
  class Janken
    def pon(player_hand, enemy_hand)
      # Remplacez ["goo", "choki", "par"] la variable "janken".
      # puts player_hand.class
      # puts enemy_hand.class
      janken = ["Goo", "Choki", "Par"]
      #「相手の手は#{相手の手}です。」と出力させます。
      print "la main de l'adversaire est #{janken[enemy_hand]}."
      if player_hand == enemy_hand
        # "Aiko" est sorti.
        puts "égalité"
        # Renvoie "true" pour exécuter à plusieurs reprises des roche-papier-ciseaux.
        return true
      elsif  (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
        puts "Vous gagné"
        return false 
      else
        puts "Vous perdez."
        return false
      end
    end
  end
  # Écrivez la logique pour exécuter le jeu roche-papier-ciseaux.
  class GameStart
    # selfを使用することで、GameStartをインスタンス化することなく、nom de la classeを使ってjankenponメソッドを呼び出せます。
    def self.jankenpon
      # Remplacez le Player instancié par la variable "player".
  
  
      player = Player.new
      #Assignez une instanciation d'Enemy à la variable "ennemi".
  
  
  
      enemy = Enemy.new
      #Assignez une instanciation de Janken à la variable "janken".
  
  
      janken = Janken.new
      next_game = true
      while next_game == true do
        # J'utilise des roche papier ciseaux avec "janken.pon (player.hand, ennemi.hand)".
        #「janken.pon(player.hand, enemy.hand)」でじゃんけんを実行しています。
        # puts "enemy #{enemy.hand}"
        # puts "player #{player.hand}"
        next_game = janken.pon(player.hand, enemy.hand)
      end
    end
  end
  # Appelez la méthode jankenpon avec le nom de la classe.
  GameStart.jankenpon

  