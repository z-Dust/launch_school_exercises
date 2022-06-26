#=begin

class Player
  attr_accessor :total, :hand

  def initialize
    @total = 0
    # @aces = 0
    @hand = Array.new
    # @bust = false
  end

  # def accumulate_card(card)
  #   if card.is_a? Integer
  #     @total += card
  #   elsif card == 'A' && (total + 11) < 22
  #     @total += 11
  #     @aces += 1
  #   elsif card == 'A'
  #     @total += 1
  #   else
  #     @total += 10
  #   end
  # end

  def calc_card(card)
    if card.is_a?(Integer)
      card
    elsif card == 'A'
      11
    else
      10
    end
  end

  def calc_hand
    @total = @hand.map do |card|
      calc_card(card)
    end.sum
  end

  def bust?
    @hand.count('A').times do
      @total -= 10
      break if @total < 22
    end if @total > 21
    @total > 21
  end

  # def bust?
  #   if total > 21 && @aces > 0
  #     loop do
  #       @total -= 10
  #       @aces -= 1
  #       break if total < 22 || @aces == 0
  #     end
  #   end
  #   # @bust = true if
  #   total > 21
  #   # @bust
  # end

  def <<(card)
    @hand << card
  end

  # def <<(card)
  #   @hand << card
  #   accumulate_card(card)
  #   bust?
  # end

  def to_s
    "hand total: #{total} - hand: #{hand.join(', ')}"
  end

  def >(other_hand)
    @total > other_hand.total && !(bust?)
  end

  def ==(other_hand)
    @total == other_hand.total && !(bust?)
  end
end

class Dealer < Player
  # attr_accessor :hidden_card, :hidden_value

  def initialize
    super
    @visible_total = 0
  end

  def display_visible_hand
    # accumulate_card(hidden_card)


    # "Dealer | hand total: #{total} - hand: #{hidden_card}, #{hand.join(', ')}"
    "hand total: #{@visible_total} - hand: #{hand[1..-1].join(', ')}"
  end

  # def hide_card(card)
  #   @hidden_card = card
  #   @hidden_value = calculate_hidden_card(card)
  # end

  def less_than_17?
    @total < 17
  end

  def calc_visible_hand
    @visible_total = @hand[1..-1].map { |card| calc_card(card) }.sum
  end

  # def bust?
  #   if @total + @hidden_value > 21 && @aces > 0
  #     loop do
  #       @total -= 10
  #       @aces -= 1
  #       break if @total + @hidden_value < 22 || @aces == 0
  #     end
  #   end
  #   # @bust = true if
  #   @total + @hidden_value > 21
  #   # @bust
  # end

  # def accumulate_card(card)
  #   if card.is_a? Integer
  #     @total += card
  #   elsif card == 'A' && (@total + 11) < 22
  #     @total += 11
  #     @aces += 1
  #   elsif card == 'A'
  #     @total += 1
  #     @aces += 1
  #   else
  #     @total += 10
  #   end
  # end

  # def calculate_hidden_card(card)
  #   if card.is_a? Integer
  #     @hidden_value = card
  #   elsif card == 'A' #&& (@total + 11) < 22
  #     @hidden_value = 11
  #     @aces += 1
  #   # elsif card == 'A'
  #   #   @hidden_value = 1
  #   else
  #     @hidden_value = 10
  #   end
  # end

end

class Deck
  attr_accessor :deck

   DECK = {'A' => 4, 2 => 4, 3 => 4, 4 => 4, 5 => 4, 6 => 4, 7 => 4, 8 => 4, 9 => 4, 10 => 4, 'J' => 4, 'Q' => 4, 'K' => 4}

  def initialize
    @deck = DECK.clone
  end

  def deal
    card = deck.select {|_,v| v > 0}.keys.sample
    deck[card] -= 1
    card
  end
end

class Game
  def initialize
    @human = Player.new
    @computer = Dealer.new
    @deck = Deck.new
  end

  def game_loop
    deal_starting_hands
    display_both_starting_hands
    human_turn
    computer_turn
    display_both_hands_final
    display_winner
  end

  def deal_starting_hands
    deal_human_starting_hand
    deal_computer_starting_hand
  end

  def human_turn
    loop do
      puts 'hit(1) or stay(2)?'
      answer = gets.chomp

        while answer != '1' && answer != '2'
          puts 'must enter 1 to hit or 2 to stay'
          answer = gets.chomp
          break if answer == '1' || answer == '2'
        end

      break if answer == '2'
      @human << @deck.deal
      @human.calc_hand
      if @human.bust?
        puts ''
        puts "you've bust"
        break
      end
      puts ''
      puts @human
    end
  end

  def computer_turn
    @computer.calc_hand
    @computer.bust?
    return if @human.bust?

    while @computer.less_than_17?
      @computer << @deck.deal
      @computer.calc_hand
      @computer.bust?
    end

    @computer.calc_hand
    puts "\ndealer bust" if @computer.bust?
  end

  def deal_starting_hands
    @human << @deck.deal
    @human << @deck.deal
    @computer << @deck.deal
    @computer << @deck.deal
  end

  def display_winner
    if @computer.bust? && @human.bust?
      puts 'no winner, both player and dealer bust'
    elsif @human > @computer || (@computer.bust? && !@human.bust?)
      puts 'human won!'
    elsif @computer > @human || (@human.bust? && !@computer.bust?)
      puts 'dealer won!'
    elsif @computer == @human
      puts "you've tied with the dealer, dealer wins!"
    else
      puts 'no winner, both player and dealer bust'
    end
  end

  def display_both_starting_hands
    @human.calc_hand
    @computer.calc_visible_hand

    puts "\nDealer | #{@computer.display_visible_hand}"
    puts "\nPlayer | #{@human}"
    puts ''
  end

  def display_both_hands_final
    @computer.calc_hand
    @computer.bust?
    @human.calc_hand
    @human.bust?

    puts "\nDealer | #{@computer}"
    puts "\nPlayer | #{@human}"
    puts ''
  end

end

a = Game.new
a.game_loop
#=end
