require 'pry'

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

# The `prompt_user` Method

# This method asks the user for input by outputting the phrase "Type 'h' to hit or
# 's' to stay".

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

# The `get_user_input` Method

# This method is very basic. It only needs to use the `gets` method to capture the
# user's input. Eventually, when we take all of these helper methods and assemble
# them into the larger method that enacts the gameplay, this method will be used
# *after* we prompt the user for input to actually capture and store their input.

def get_user_input
  gets
end

# The `end_game` Method

# This method takes in an argument of a number, which will be a player's card
# total, and outputs the message "Sorry, you hit #{card_total}. Thanks for
# playing!"

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

# The `initial_round` Method

# This method represents the first round of the game for a given player. It should
# call on the `deal_card` method twice, use the `display_card_total` method to
# `puts` out the sum *and then* return the sum. This method will, therefore, call on
# two other helper methods, `deal_card` and `display_card_total`, which takes in
# an argument of the sum of both invocations of `deal_card`.

def initial_round
  card_total = deal_card + deal_card
  display_card_total(card_total)
  card_total
end

# The `hit?` Method

# This method is a bit more complex. It should take in an argument of the player's
# current card total. So, set up your `hit?` method to take in an argument of a
# number.

# Then, the method should use the `prompt_user` method to prompt the user for
# input and the `get_user_input` method to get and store the user's input. Now we
# need to implement some logic. If the player's input is `'s'`, we don't deal a
# new card. If the player's input is `'h'`, we do need to deal a new card. In this
# case, use the `deal_card` method to deal a new card and increment the player's
# card total by whatever number is returned by `deal_card`.

# If the player's input is *neither* `'h'` *nor* `'s'`, call on the
# `invalid_command` method to output the phrase "Please enter a valid command".
# Then, call on the `prompt_user` method again to remind your user what a valid
# command is.  

# In either case, our method should then return the player's current card total.

def hit?(card_total)
  prompt_user
  input = get_user_input
  
  if input != "h" && input != "s" 
    invalid_command
    prompt_user
    input = get_user_input
  elsif input == "s"
    card_total
  else input == "h"
    card_total += deal_card
    card_total
  end 
  
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

# Once you get all of the tests in the first part of the test suite passing, you
# have built the building blocks of our blackjack game. Now, we need to put them
# all together in the `runner` method. The `runner` method is responsible for
# enacting the gameplay *until* the user loses. Remember that a player loses if
# the sum of their cards exceeds 21.

# Here's how we want our game to run:

# 1. Welcome the user
# 2. Deal them their first two cards, i.e. their `initial_round`
# 3. Ask them if they want to hit or stay
# 4. If they want to stay, ask them again!
# 5. If they want to hit, deal another card and display the new total
# 6. If their card total exceeds 21, the game ends.

# Use a loop constructor (I'd recommend `until`, but that is by no means your only
# option) to enact the above gameplay in the `runner` method. Then, check out the
# `lib/runner.rb` file. Notice that it is simply calling the `runner` method. The
# runner file will call the `runner` method which should, in turn, utilize all the
# other methods you built!
  
def runner
  card_total = 0 
  welcome 
  card_total = initial_round 
 
  until card_total > 21
    hit?(card_total)
    display_card_total(card_total)
  end
    end_game(card_total)
end
