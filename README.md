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
1. Clone it via GitHub: https://github.com/zaslam72/linkedinhang 
    ``` 
    git clone https://github.com/zaslam72/linkedinhang.git 
    ```
    ..-Follow the instructions installation steps below
2. Zipped Folder


 ..- cd into the repository
 ..- install all dependencies
 ```
 bundle install
 ```
 ..- open a server 
 ```
 rails server 
 ```
 ..- open the local port specified (most likely localhost:3000) 
 


1.  Check it out on Heroku: https://linkedin-hangman.herokuapp.com
(2) Clone it via GitHub: https://github.com/zaslam72/linkedinhang
    - git clone https://github.com/zaslam72/linkedinhang.git
    - follow instructions below 
(3) 
    - cd into the repository 
    - bundle install 
    - rails s or rails server
    - open the local port specified (most likely localhost:3000)


Minimum Viable Product (MVP): 
- Getting the word: Computer pings the LinkedIn API for the word 
- Displaying the secret word: The length of the secret word is displayed via underscores to the user
- Selection of letter: The user can select a letter to guess 
- Correct Selection: The user will see the letter placed in its correct spot(s) in the word 
- Incorrect Selection: The letter will be placed in a separate box and the remaining guesses count will decrease by 1
- User lost: User can make six incorrect guesses before the computer wins
- User won: The user guessed all the letters in the secret word before the six chances are up


Going beyond the MVP: 
- Difficulty Level: User can select a difficulty level based off how lucky they're feeling or how skilled they're are. Difficulty levels include easy, medium, hard, and surprise me.
- Leaderboard: Members who have played at least one game are automatically added to the leaderboard. The board shows the top users by their win rates (games won / games played).
- Friendship: Members can connect with other members via a friendship. This makes it easier for users to track how their friends are doing without skimming through the leaderboard. 
- Bandaids: Members are given three bandaids when they sign up. They can use these bandaids as lifelines to restore one body part in the middle of the game 
- Hangman Display: Users can see the physical hangman diagram as they guess incorrectly 
- Quit Button: Users can quit in the middle of the game if they choose 
- Share Buttons: If a user wins a game, they can showcase their awesomeness by sharing a Tweet or a LinkedIn post. 
- Spotify: Who doesn't love to listen to upbeat music as they play word games? Spotify users have the capability to listen to music as they play 




*****DOCUMENT YOUR THOUGHT PROCESS AND/OR CODE STRUCTURE*******
