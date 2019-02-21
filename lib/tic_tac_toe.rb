class TicTacToe
  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i-1
  end

  def move(index, player_token = "X")
    @board[index] = player_token
  end

  def position_taken?(index)
    if @board[index] == nil || @board[index] == " "
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|player_token| player_token == "X" || player_token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
      player_token = current_player
      move(index, player_token)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each { |combinations|
      index0 = combinations[0]
      index1 = combinations[1]
      index2 = combinations[2]

      position0 = @board[index0]
      position1 = @board[index1]
      position2 = @board[index2]

      if position0 == "X" && position1 == "X" && position2 == "X"
        return combinations
      elsif position0 == "O" && position1 == "O" && position2 == "O"
        return combinations
      end
    }
    return false
  end

  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw?
      return true
    else
      false
    end
  end

  def winner
    index = []
    index = won?)
    if index == false
      return nil
    elsif @board[index[0]] == "X"
      return "X"
    elsif @board[index[0]] == "O"
      return "O"
    end
  end

  def play
    until over? == true
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
