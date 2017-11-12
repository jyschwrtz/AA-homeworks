  class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    @current_move_stack = []
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |i|
      4.times { @cups[i] << :stone } unless i == 6 || i == 13
    end
  end

  def valid_move?(start_pos)
    if start_pos.between?(1, 13) && start_pos != 6
    else
      raise ArgumentError.new("Invalid starting cup")
    end
  end

  def make_move(start_pos, current_player_name)
    until @cups[start_pos].empty?
      @current_move_stack << @cups[start_pos].pop
    end
    index = start_pos

    until @current_move_stack.empty?
      index += 1
      index -= 14 if index > 13
      next if index == 13 && current_player_name == @name1
      next if index == 6 && current_player_name == @name2
      @cups[index] << @current_move_stack.pop
    end
    render
    # sleep(1)
    next_turn(index)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].length == 1
      :switch
    elsif @cups[ending_cup_idx].length > 1
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |i| @cups[i].empty? } ||
      (7..12).all? { |i| @cups[i].empty? }
  end

  def winner
    case @cups[13].length <=> @cups[6].length
    when 1
      @name2
    when -1
      @name1
    when 0
      :draw
    end
  end
end
