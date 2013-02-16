class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # YOUR CODE HERE
  raise NoSuchStrategyError unless m1[1] =~ /^(r|p|s){1}$/i && m2[1] =~ /^(r|p|s){1}$/i
  result = case
    when m1[1].downcase == 'r' && m2[1].downcase == 's' then m1
    when m1[1].downcase == 'p' && m2[1].downcase == 'r' then m1
    when m1[1].downcase == 's' && m2[1].downcase == 'p' then m1
    when m1[1].downcase == m2[1].downcase then m1
    else m2
  end
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  # YOUR CODE HERE
  rps_result(game[0], game[1])
end

def rps_tournament_winner(tournament)
  # YOUR CODE HERE
  if tournament[0][0].class == String
    return rps_result(tournament[0], tournament[1])
  else
    tournament = [].push(rps_tournament_winner(tournament[0])).push(rps_tournament_winner(tournament[1]))
    return rps_tournament_winner(tournament)
  end
end

# #spec
# On Time 
# #rps_game_winner
  # should be defined
  # should raise WrongNumberOfPlayersError if there are not exactly two players [1 point]
  # should raise NoSuchStrategyError if there is some strategy that is not R, P, or S [4 points]
  # should return the correct winner in a simple RPS game with a clear winner [15 points]
  # should return the first player in the case of a tie [10 points]

# #rps_tournament_winner
  # should be defined
  # should still be able to handle the case where a tournament is just one game [10 points]
  # should pass the example given in the homework of an 8-player tournament [5 points]
  # should pass a basic test case of 8 players [15 points]
  # should return the correct winner in the cases of 16 and 32-man tournaments [40 points]

# Finished in 0.01855 seconds
# 10 examples, 0 failures
