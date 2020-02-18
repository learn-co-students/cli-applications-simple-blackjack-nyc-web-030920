require 'pry'

def welcome
  # code #welcome here
  puts "Welcome to the Blackjack Table"
end

def deal_card
  # code #deal_card here
  random = rand(1..11)
end

def display_card_total(total)
  # code #display_card_total here
  puts "Your cards add up to #{total}"
end

def prompt_user
  # code #prompt_user here
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  # code #get_user_input here
  input = gets.chomp
end

def end_game(total)
  # code #end_game here
  puts "Sorry, you hit #{total}. Thanks for playing!"
end

def initial_round
  # code #initial_round here
  hand1 = deal_card
  hand2 = deal_card 
  total_hand = hand1 + hand2 
  display_card_total(total_hand)
  return total_hand
end

# def hit?(total_hand)
#   # code hit? here
  
#   prompt_user
#   input = get_user_input
#   if input == "h"
#     total_hand += deal_card
#   elsif input == "s"
#     total_hand
#   else
#     invalid_command
#   end
# end

def hit?(total_hand)
  prompt_user
  input = get_user_input
  while input != "h" && input != "s"
    invalid_command
    prompt_user
    input = get_user_input
  end
  if input == "h"
    total_hand += deal_card
  end
  return total_hand
end

def invalid_command
  # code invalid_command here
  puts "Please enter a valid command"
end


#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome 
  total = initial_round 
  while total < 21 
    total = hit?(total)
    display_card_total(total)
  end
  end_game(total)
end
    
