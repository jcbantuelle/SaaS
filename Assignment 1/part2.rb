class WrongNumberOfPlayersError < StandardError ; end 
class NoSuchStrategyError < StandardError ; end

RPS_MOVES = {"P" => "R", "S" => "P", "R" => "S"}

class Player
  attr_accessor :name, :move
  
  def initialize(player)
    @name = player[0]
    @move = player[1]
  end
end

def rps_game_winner(game)  
  raise WrongNumberOfPlayersError unless game.length == 2
  player1 = Player.new(game[0])
  player2 = Player.new(game[1])
  raise NoSuchStrategyError unless RPS_MOVES.include?(player1.move) and RPS_MOVES.include?(player2.move)
  
  return [player1.name, player1.move] if player1.move == player2.move
  
  loser = RPS_MOVES.select{|winner, loser| (winner == player1.move and loser == player2.move) or (winner == player2.move and loser == player1.move)}[0]
  player1.move == loser[1] ? [player2.name, player2.move] : [player1.name, player1.move]
end

def rps_tournament_winner(tournament)
  return rps_game_winner(tournament) if tournament[0][0].is_a? String
  rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
end