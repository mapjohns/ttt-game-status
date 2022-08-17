# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def won?(board)
  winner = nil
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] && position_taken?(board, combo[0]) == true
      winner = combo
    end
  end
  return winner.nil? ? false : winner
end

def full?(board)
  total = 0
  board.each do |spot|
    if spot == "X" || spot == "O"
      total += 1
    end
  end
  return total == 9 ? true : false
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  elsif won?(board) == false && full?(board) == false || won?(board) == true
    return false
  end
end

def over?(board)
  if draw?(board) == true || (won?(board) != false && full?(board) == true) || (won?(board) != false && full?(board) == false)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  else
    return nil
  end
end