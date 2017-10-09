class Simon
  COLORS = %w(R B G Y)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(show_time = 4)
    @sequence_length = 1
    @game_over = false
    @seq = []
    @show_time = show_time
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    system("clear")
    puts "LEVEL #{@sequence_length}:"
    show_sequence
    require_sequence
    round_success_message unless @game_over
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    puts @seq
    sleep(@show_time)
    system("clear")
  end

  def require_sequence
    puts "Please input the sequence (i.e. 'R,G,Y,B,R'):"
    guess = gets.chomp
    guess = parse(guess)
    @game_over = true unless guess == @seq
  end

  def parse(input)
    input.delete(" ").split(",")
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Correct Sequence! Level #{@sequence_length + 1} up next!"
    sleep(1)
  end

  def game_over_message
    puts "Incorrect Sequence.  The correct sequence was #{@seq}"
    sleep(2)
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
