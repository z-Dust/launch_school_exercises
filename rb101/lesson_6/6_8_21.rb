require 'pry'

DECK = {
  'Hearts': ['Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight',
             'Nine', 'Ten', 'Jack', 'Queen', 'King'],
  'Clubs': ['Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight',
            'Nine', 'Ten', 'Jack', 'Queen', 'King'],
  'Diamonds': ['Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight',
               'Nine', 'Ten', 'Jack', 'Queen', 'King'],
  'Spades': ['Ace', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight',
             'Nine', 'Ten', 'Jack', 'Queen', 'King']
}

CONVERT = {
  'Ace': 11, 'Two': 2, 'Three': 3, 'Four': 4, 'Five': 5, 'Six': 6, 'Seven': 7,
  'Eight': 8, 'Nine': 9, 'Ten': 10, 'Jack': 10, 'Queen': 10, 'King': 10
}

BUST = 21
DEALER_LIMIT = 17

# create a deep copy
def deep_dup(obj) # deep clone
  Marshal.load(Marshal.dump(obj))
end

# deal card and remove from deck
def deal_card(active_deck)
  suit = active_deck.to_a.sample
  "#{suit[1].delete(suit[1].sample)} of #{suit[0]}"
end

# determine numerical value of card
def convert_card_value(card_value)
  CONVERT[card_value.to_sym]
end

# extract relevant string from total card string
def extract_card_value(dealt_card)
  dealt_card.split[0]
end

# store card name and value in respective arrays
def store_and_convert_single_card(dealt_card, raw_cards_arr, card_values_arr)
  raw_cards_arr << dealt_card
  card_values_arr << convert_card_value(extract_card_value(raw_cards_arr.last))
end

# initial hand calculation
def calc_hand_value(card_values_arr)
  card_values_arr.sum
end

# calc hand value, if over 21 and an ace is present, change ace value
def calc_hand_value_1_or_11(card_values_arr)
  if card_values_arr.sum <= BUST
    card_values_arr.sum
  elsif card_values_arr.include?(11)
    card_values_arr[card_values_arr.index(11)] = 1
    if card_values_arr.sum <= BUST
      card_values_arr.sum
    elsif card_values_arr.include?(11)
      card_values_arr[card_values_arr.index(11)] = 1
      if card_values_arr.sum <= BUST
        card_values_arr.sum
      elsif card_values_arr.include?(11)
        card_values_arr[card_values_arr.index(11)] = 1
        if card_values_arr.sum <= BUST
          card_values_arr.sum
        elsif card_values_arr.include?(11)
          card_values_arr[card_values_arr.index(11)] = 1
        end
      end
    end
  else
    card_values_arr.sum
  end
end

# display player and dealer hands and hand values
def display_cards(player_cards, dealer_cards, dealer_hand_value,
                  player_hand_value)
  system 'clear'
  puts "    <-------------------------<>-------------------------->"
  puts "<---------------<>---<>---TWENTY-ONE---<>---<>---------------->"
  puts "    <-------------------------<>-------------------------->"
  puts "\nThe dealer's hand value is: #{dealer_hand_value}"
  puts "-------------------------------"
  dealer_cards.each { |card| puts card }

  puts "\nYour hand value is: #{player_hand_value}"
  puts "-------------------------------"
  player_cards.each { |card| puts card }
end

# outer game loop
loop do
  active_deck = deep_dup(DECK) # initialize deck
  player_cards = []
  player_card_values = []
  dealer_cards = []
  dealer_card_values = []

  2.times do # initial deal to player and dealer
    store_and_convert_single_card(deal_card(active_deck), player_cards,
                                  player_card_values)
    store_and_convert_single_card(deal_card(active_deck), dealer_cards,
                                  dealer_card_values)
  end

  # calculate dealers hand value minus hidden card, siaplay hands
  dealer_hand_value = calc_hand_value(dealer_card_values[1..-1])
  player_hand_value = calc_hand_value(player_card_values)
  display_cards(player_cards, dealer_cards[1..-1], dealer_hand_value,
                player_hand_value)

  # player loop
  while player_hand_value < BUST
    puts "\nhit or stay?"
    answer = gets.chomp
    break if answer.downcase.start_with?('s')
    store_and_convert_single_card(deal_card(active_deck), player_cards,
                                  player_card_values)

    player_hand_value = calc_hand_value_1_or_11(player_card_values)
    display_cards(player_cards, dealer_cards[1..-1], dealer_hand_value,
                  player_hand_value)
  end



  # if player busts dealer wins
  if player_hand_value > BUST
    puts "\n=> Player busts, dealer wins!"
  else # deal dealer cards until dealer limit is reached
    while calc_hand_value_1_or_11(dealer_card_values) < DEALER_LIMIT
      store_and_convert_single_card(deal_card(active_deck), dealer_cards,
                                    dealer_card_values)
    end

    dealer_hand_value = calc_hand_value(dealer_card_values)

    display_cards(player_cards, dealer_cards, dealer_hand_value,
                  player_hand_value)

    # determine winner/tie
    if dealer_hand_value > BUST
      puts "\n=> Dealer busts, player wins!"
    elsif player_hand_value > dealer_hand_value
      puts "\n=> Player wins!"
    elsif player_hand_value < dealer_hand_value
      puts "\n=> Dealer wins!"
    else
      puts "\n=> It's a tie!"
    end
  end

  puts "\n=> Do you want to play again?"
  answer = gets.chomp
  break if !answer.downcase.start_with?('y')
end
