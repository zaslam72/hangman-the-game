#############################################################################################################################################
                                                          # USERS SEED #
#############################################################################################################################################

zara = User.create!(name: "Zara", username: "zarazara", password: "password", games_won: 15, games_lost: 7, games_played: 22, bandaids: 3)
joe = User.create!(name: "Joe", username: "joejoe", password: "password", games_won: 23, games_lost: 2, games_played: 25, bandaids: 3)
bob = User.create!(name: "Bob", username: "bobbob", password: "password", games_won: 13, games_lost: 5, games_played: 18, bandaids: 3)
sam = User.create!(name: "Sam", username: "samsam", password: "password", games_won: 2, games_lost: 2, games_played: 4, bandaids: 3)
lisa = User.create!(name: "Lisa", username: "lisalisa", password: "password", games_won: 5, games_lost: 2, games_played: 7, bandaids: 3)
mary = User.create!(name: "Mary", username: "marymary", password: "password", games_won: 4, games_lost: 15, games_played: 19, bandaids: 3)
julie = User.create!(name: "Julie", username: "juliejulie", password: "password", games_won: 6, games_lost: 5, games_played: 11, bandaids: 3)
sarah = User.create!(name: "Sarah", username: "sarahsarah", password: "password", games_won: 23, games_lost: 23, games_played: 46, bandaids: 3)
tim = User.create!(name: "Tim", username: "timtim", password: "password", games_won: 8, games_lost: 34, games_played: 42, bandaids: 3)
tony = User.create!(name: "Tony", username: "tonytony", password: "password", games_won: 1, games_lost: 8, games_played: 9, bandaids: 3)
marie = User.create!(name: "Marie", username: "mariemarie", password: "password", games_won: 0, games_lost: 1, games_played: 1, bandaids: 3)
tonya = User.create!(name: "Tonya", username: "tonyatonya", password: "password", games_won: 4, games_lost: 23, games_played: 27, bandaids: 3)
ben = User.create!(name: "Ben", username: "benben", password: "password", games_won: 34, games_lost: 34, games_played: 68, bandaids: 3)
steve = User.create!(name: "Steve", username: "stevesteve", password: "password", games_won: 6, games_lost: 6, games_played: 12, bandaids: 3)
jess = User.create!(name: "Jess", username: "jessjess", password: "password", games_won: 3, games_lost: 55, games_played: 58, bandaids: 3)
megan = User.create!(name: "Megan", username: "meganmegan", password: "password", games_won: 32, games_lost: 66, games_played: 98, bandaids: 3)
tere = User.create!(name: "Tere", username: "teretere", password: "password", games_won: 5, games_lost: 9, games_played: 14, bandaids: 3)
kat = User.create!(name: "Kat", username: "katkat", password: "password", games_won: 23, games_lost: 1, games_played: 24, bandaids: 3)
max = User.create!(name: "Max", username: "maxmax", password: "password", games_won: 45, games_lost: 40, games_played: 90, bandaids: 3)
rob = User.create!(name: "Rob", username: "robrob", password: "password", games_won: 1, games_lost: 1, games_played: 2, bandaids: 3)
brandon = User.create!(name: "Brandon", username: "brandonbrandon", password: "password", games_won: 1, games_lost: 0, games_played: 1, bandaids: 3)
mike = User.create!(name: "Mike", username: "mikemike", password: "password", games_won: 5, games_lost: 3, games_played: 8, bandaids: 3)
billy = User.create!(name: "Billy", username: "billybilly", password: "password", games_won: 65, games_lost: 15, games_played: 80, bandaids: 3)
stephanie = User.create!(name: "Stephanie", username: "stephaniestephanie", password: "password", games_won: 3, games_lost: 8, games_played: 11, bandaids: 3)
frank = User.create!(name: "Frank", username: "frankfrank", password: "password", games_won: 4, games_lost: 5, games_played: 9, bandaids: 3)
alex = User.create!(name: "Alex", username: "alexalex", password: "password", games_won: 2, games_lost: 10, games_played: 12, bandaids: 3)
katie = User.create!(name: "Katie", username: "katiekatie", password: "password", games_won: 42, games_lost: 3, games_played: 45, bandaids: 3)
justin = User.create!(name: "Justin", username: "justinjustin", password: "password", games_won: 100, games_lost: 76, games_played: 176, bandaids: 3)
jake = User.create!(name: "Jake", username: "jakejake", password: "password", games_won: 21, games_lost: 54, games_played: 75, bandaids: 3)
sandra = User.create!(name: "Sandra", username: "sandrasandra", password: "password", games_won: 34, games_lost: 32, games_played: 66, bandaids: 3)



#############################################################################################################################################
                                                        # FRIENDSHIP SEED #
#############################################################################################################################################

Friendship.create!(user_id: zara.id, friend_id: katie.id)
Friendship.create!(user_id: zara.id, friend_id: julie.id)
Friendship.create!(user_id: zara.id, friend_id: sam.id)
Friendship.create!(user_id: zara.id, friend_id: brandon.id)
Friendship.create!(user_id: zara.id, friend_id: max.id)
Friendship.create!(user_id: zara.id, friend_id: sandra.id)
Friendship.create!(user_id: zara.id, friend_id: lisa.id)
Friendship.create!(user_id: zara.id, friend_id: mary.id)
Friendship.create!(user_id: zara.id, friend_id: tonya.id)
Friendship.create!(user_id: zara.id, friend_id: tere.id)
Friendship.create!(user_id: zara.id, friend_id: frank.id) 

Friendship.create!(user_id: julie.id, friend_id: mary.id)
Friendship.create!(user_id: julie.id, friend_id: tonya.id)
Friendship.create!(user_id: julie.id, friend_id: sam.id)
Friendship.create!(user_id: julie.id, friend_id: zara.id)
Friendship.create!(user_id: julie.id, friend_id: brandon.id)

Friendship.create!(user_id: sam.id, friend_id: sandra.id)
Friendship.create!(user_id: sam.id, friend_id: max.id)
Friendship.create!(user_id: sam.id, friend_id: katie.id)
Friendship.create!(user_id: sam.id, friend_id: stephanie.id)
Friendship.create!(user_id: sam.id, friend_id: megan.id)
Friendship.create!(user_id: sam.id, friend_id: jess.id)

Friendship.create!(user_id: brandon.id, friend_id: zara.id)
Friendship.create!(user_id: brandon.id, friend_id: tonya.id)
Friendship.create!(user_id: brandon.id, friend_id: billy.id)
Friendship.create!(user_id: brandon.id, friend_id: justin.id)
Friendship.create!(user_id: brandon.id, friend_id: sandra.id)
Friendship.create!(user_id: brandon.id, friend_id: rob.id)






