require 'pry'

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  random = rand(1...11)
  return random
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  sum = deal_card()+deal_card()
  display_card_total(sum)
  return sum
end


def invalid_command
  puts 'Please enter a valid command'
end

def hit?(value)
prompt_user()
sentence = get_user_input()
  if sentence == 'h'
    card_two = deal_card()
    return card_two + value
  elsif sentence == 's'
    return value
  else
  invalid_command()
  prompt_user()
  get_user_input()
  end
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  total = 0
  new_hand = 0
  welcome()
  initial_hand = initial_round()
  display_card_total(total= hit?(initial_hand))
      until total > 21
        display_card_total(total= hit?(total))
      end
        end_game(total)
  end
