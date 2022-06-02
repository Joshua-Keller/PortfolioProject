import random

top_of_range =input("You would like to guess a number between 0 and ? ")

if top_of_range.isdigit():

    top_of_range = int(top_of_range)

    if top_of_range < 0:

        print('Please type a number between 0 and 100 next time.')

    elif top_of_range > 100:

        print('Please type a number between 0 and 100 next time.')

else:
    print('Please type a number next time.')

    quit()

random_number = random.randint(0,top_of_range)

print(random_number)

guesses = 0

while True:

    guesses += 1

    user_guess = input("Make a guess between 0 and " + str(top_of_range) +" : ")

    if user_guess.isdigit():

        user_guess = int(user_guess)

    else:

        print('Please type a number next time.')

        continue

    if user_guess == random_number:

        print("You guessed correctly after "+ str(guesses) + " times!")

        break

    elif user_guess > random_number:

        print("You guessed wrong! You were too high!")

    else:

        print("You guessed wrong! You were too low!")



