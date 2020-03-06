def welcome
  puts "Welcome to the Blackjack Table"

end

def deal_card
  
  return rand(1...11)
  
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  
 puts "Type 'h' to hit or 's' to stay"
 
end

def get_user_input
  
  choice = gets.chomp
  
  return choice
  
end

def end_game(total)
  
  if total == 21
    puts "Congratulations, you hit #{total}! Thanks for playing!"
  else
    if total > 21
      puts "Sorry, you hit #{total}. Thanks for playing!"
    end
  end

end

def initial_round
  
    initial = deal_card + deal_card
    
    display_card_total(initial)
  
    return initial
  
end

def hit?(total)
  
  prompt_user
  
  while choice = get_user_input
    case choice
    when "s"
      total
      break
    when "h"
      total += deal_card
      break
    when "exit"
      break
    else
      invalid_command
      prompt_user
    end
  end
  
  return total
  
end

def invalid_command
  
  puts "Please enter a valid command"
  
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  
  welcome
  
  sum = initial_round
  
  until sum >= 21
    sum = hit?(sum)
    display_card_total(sum)
  end
  
  end_game(sum)
  
  
end
    
