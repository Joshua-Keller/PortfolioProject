import random
user_wins = 0
computer_wins = 0
options = ["rock", "paper", "scissors", "lizard", "spock"]

#Rules for User
print("Here are the rules for the game.")

print("Rock > Scissors or Lizard")
print("Paper > Rock or Spock")
print("Scissors > Paper or Lizard")
print("Lizard > Paper or Spock")
print("Spock > scissors or Rock")



while True:
    user_input = input('Type Rock, Paper, Scissors, Lizard, Spock, or Q to Quit: ').lower()
    if user_input == 'q':
        break

    if user_input not in options:
        continue

    random_number = random.randint(0,4)
    #Rock: 0, Paper: 1, Scissors: 2, Lizard: 3, Spock: 4
    computer_choice = options[random_number]
    print("Computer picked " + str(computer_choice)+ ".")

    #Rock wins

    if user_input == 'rock' and computer_choice == 'scissors':
        print("You win. Rock crushes scissors.")
        user_wins += 1

    elif user_input == 'rock' and computer_choice == 'lizard':
        print("You win. Rock crushes lizard.")
        user_wins += 1


    #Paper wins

    elif user_input == 'paper' and computer_choice == 'rock':
        print("You win. Paper covers rock.")
        user_wins += 1
    elif user_input == 'paper' and computer_choice == 'spock':
        print("You win. Paper disproves Spock.")
        user_wins += 1

    #Scissor wins

    elif user_input == 'scissors' and computer_choice == 'paper':
        print("You win. Scissors cut paper.")
        user_wins += 1
    elif user_input == 'scissors' and computer_choice == 'lizard':
        print("You win. Scissors eliminates lizard.")
        user_wins += 1

    #Lizard wins

    elif user_input == 'lizard' and computer_choice == 'paper':
        print("You win. Lizard eats paper.")
        user_wins += 1
    elif user_input == 'lizard' and computer_choice == 'spock':
        print("You win. Lizard poisons Spock.")
        user_wins += 1

    # Spock wins

    elif user_input == 'spock' and computer_choice == 'scissors':
        print("You win. Spock smashes scissors.")
        user_wins += 1
    elif user_input == 'spock' and computer_choice == 'rock':
        print("You win. Spock vaporizes rock.")
        user_wins += 1

    # draw
    elif user_input == computer_choice:
        print("Draw.")
        continue
    else:
        print("You lost!")
        computer_wins += 1

print("You won "+ str(user_wins) + " times.")
print("The computer won " + str(computer_wins) + " times. ")
print("Thank you for Playing! Goodbye.")