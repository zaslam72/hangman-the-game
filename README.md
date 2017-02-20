# Hangman

[Hangman](https://linkedin-hangman.herokuapp.com) is a web application in which the computer challenges the users to guess the word of its choice. The user is allotted six incorrect guesses before the computer wins. If the user guesses the word, the user wins.If you're eager to check out some of the functionality but don't want to start with a blank account, feel free to use the *following*:<br>
- **username:** zarazara<br>
- **password:** password

### Built Using:  
1. **Framework/Back-End:** Ruby on Rails 
2. **Front-End:** HTML, CSS, Semantic UI framework 
3. **Database:** PostgreSQL
4. **Deployment:** Heroku

### Launch the web application: 
1. **Clone it via [GitHub](https://github.com/zaslam72/linkedinhang):**
    ``` 
    git clone https://github.com/zaslam72/linkedinhang.git 
    ```
  - Follow the instructions installation steps below
    
2. **Zipped Folder**
  - cd into the repository
  - install all dependencies
 ```
 bundle install
 ```
 - open a server 
 ```
 rails server 
 ```
 - open the local port specified (most likely localhost:3000) 

3. **Check it out on [Heroku](https://linkedin-hangman.herokuapp.com)**


### Minimum Viable Product (MVP): 
- **Getting the word:** Computer pings the LinkedIn API for the word 
- **Displaying the secret word:** Length of the secret word is displayed via underscores to the user
- **Selection of letter:** User can select a letter to guess 
- **Correct Selection:** User will see the letter placed in its correct spot(s) in the word 
- **Incorrect Selection:** Letter will be placed in a separate box and the remaining guesses count will decrease by 1
- **User lost:** User can make six incorrect guesses before the computer wins
- **User won:** User guessed all the letters in the secret word before the six chances are up


### Going beyond the MVP: 
- **Difficulty Level:** User can select a difficulty level based off how lucky they're feeling or how skilled they're are. Difficulty levels include easy, medium, hard, and surprise me.
- **Leaderboard:** Members who have played at least one game are automatically added to the leaderboard. The board shows the top users by their win rates (games won / games played).
- **Friendship:** Members can connect with other members via a friendship. This makes it easier for users to track how their friends are doing without skimming through the leaderboard. 
- **First Aid:** Members are given three bandaids when they sign up. They can use these bandaids as lifelines to restore one body part in the middle of the game 
- **Hangman Display:** Users can see the physical hangman diagram as they guess incorrectly 
- **Quit Button:** Users can quit in the middle of the game if they choose 
- **Share Buttons:** If a user wins a game, they can showcase their awesomeness by sharing a Tweet or a LinkedIn post. 
- **Spotify:** Who doesn't love to listen to upbeat music as they play word games? Spotify users have the capability to listen to music as they play 
- **Tests:** I wanted to practice test-driven development, so I implemented tests to check my models and routes before adding functionality to my controllers. I also wrote a few controller tests for additional testing practice. 


### Workflow: 
- I used an agile development approach when solving this problem 
- I read the instructions and mapped out all the information I was given 
- I decided early which tech stack I wanted to use
- I mapped out what information my database would need to store along with what models, views, and controllers I would need
- I created an outline of what my MVP would look like along with any additional features I wanted to add 
- I pseudocoded the algorithm of the actual hangman game
- I set up my associations and my routes and began testing
- I implemented one feature at a time before I moved on to the next
- I created a seeds file and deployed to Heroku

### Code Structure: 
- I used the MVC model 
- **Models**
 - I have three models: user, game, friendship
 - My 
- My Users controller handles the displayment of the leaderboard, creating new users, assigning sessions id, creating friendships, and destroying friendships 
- My Games controller handles the creation of a new game, updating each game when a user selects a letter, and deleting the game if one decides to leave mid-way 
- My Sessions controller handles loggin in and assigning sessions id 


*****DOCUMENT YOUR THOUGHT PROCESS AND/OR CODE STRUCTURE*******
