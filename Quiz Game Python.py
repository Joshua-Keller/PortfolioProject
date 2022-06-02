#Introduction

print("Welcome to my math quiz!")

playing = input("Do you want to play my game? ")
if playing.lower() !='yes':
        quit()
    
print("Great! Let's get started.")
score = 0

#Question 1
answer1 = input("I have 10 apples, but my friends want apples too. I need to have 3 apples for myself. How many apples can I give away? ")
if answer1 == '7':
        print("Correct!")
        score += 1
elif answer1.lower() == 'seven':
        print("Correct!")
        score += 1

else:
    print("Incorrect!")


#Question 2
answer2 = input("If x is equal to 2, what is (x^2), divided by 2, subtracted by 4, and multiplied by -1? ")

if answer2 == '2':
        print("Correct!")
        score += 1
elif answer2.lower() == 'two':
        print("Correct!")
        score += 1

else:
    print("Incorrect!")


#Question 3
answer3 = input("Using the Empirical rule, what percent of data lies within one standard deviation of the mean? Include % in answer: ")

if answer3 == '68%':
        print("Correct!")
        score += 1
elif answer3.lower() == 'sixty eight percent':
        print("Correct!")
        score += 1
elif answer3.lower() == 'sixty eight %':
        print("Correct!")
        score += 1
else:
    print("Incorrect!")


#Question 4
answer4 = input("How many seconds are in an hour? ")

if answer4 == '3600':
        print("Correct!")
        score += 1
elif answer4 == '3,600':
        print("Correct!")
        score += 1
elif answer4.lower() == 'three thousand six hundred':
        print("Correct!")
        score += 1
elif answer4.lower() == 'three thousand six hundred seconds':
        print("Correct!")
        score += 1
else:
    print("Incorrect!")


#Question 5
answer5 = input("I have 4 fish and 2 apples. I give away 3 bananas, 1 fish, and 2 apples. I eat 2 fish on the way home. How many fish are left? ")

if answer5 == '1':
        print("Correct!")
        score += 1
elif answer5.lower() == 'one':
        print("Correct!")
        score += 1
elif answer5.lower() == 'one fish':
        print("Correct!")
        score += 1
elif answer5.lower() == '1 fish':
        print("Correct!")
        score += 1
else:
    print("Incorrect!")


#Question 6
answer6 = input("A square with a length of 14, and a height of 12 has an area that equals? ")

if answer6 == '168':
        print("Correct!")
        score += 1
elif answer6.lower() == 'one hundred and sixty eight':
        print("Correct!")
        score += 1
elif answer6.lower() == 'one hundred sixty eight':
        print("Correct!")
        score += 1
else:
    print("Incorrect!")


#Question 7
answer7 = input("To fix a car it cost $3843 in materials and cost $150 per hour for labor. How much would it cost to fix a car that required 27 hour, 15 minutes, and 4 seconds of work? Round to the second decimal: ")

if answer7 == '7,930.67':
        print("Correct!")
        score += 1
elif answer7 == '7930.67':
        print("Correct!")
        score += 1
elif answer7.lower() == 'seven thousand nine hundred thirty dollars and sixty seven cents':
        print("Correct!")
        score += 1
elif answer7.lower() == 'seven thousand nine hundred thirty dollars and sixty seven cent':
        print("Correct!")
        score += 1
elif answer7.lower() == 'seven thousand nine hundred thirty dollars sixty seven cent':
        print("Correct!")
        score += 1
elif answer7.lower() == 'seven thousand nine hundred thirty dollars sixty seven cents':
        print("Correct!")
        score += 1
else:
    print("Incorrect!")


#Question 8
answer8 = input("What is the SAMPLE standard deviation of (7,4,14,32,6,4,1)? Round to the second decimal: ")

if answer8 == '10.63':
        print("Correct!")
        score += 1
else:
    print("Incorrect!")


#Question 9
answer9 = input("A large box contains 30 small boxes of markers. Each small box contains 50 markers. You have 2 large boxes of markers to share with 25 students. How many markers does each student receive? ")

if answer9 == '120':
        print("Correct!")
        score += 1
elif answer9.lower() == 'one hundred and twenty':
        print("Correct!")
        score += 1
elif answer9.lower() == 'one hundred twenty':
        print("Correct!")
        score += 1
else:
    print("Incorrect!")


#Question 10
answer10 = input("16 ounces is equivalent to how many pounds? ")

if answer10 == '1':
        print("Correct!")
        score += 1
elif answer10.lower() == 'one':
        print("Correct!")
        score += 1
elif answer10.lower() == '1 pound':
        print("Correct!")
        score += 1
elif answer10.lower() == 'one pound':
        print("Correct!")
        score += 1
elif answer10.lower() == 'a pound':
        print("Correct!")
        score += 1
else:
    print("Incorrect!")

print("Well done! You answered " + str(score) + " questions correct!")
print("Your score is "+ str((score/10)*100) + "%.")


    
