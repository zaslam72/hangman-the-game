class User < ApplicationRecord
  # set bcrypt
  has_secure_password
  
# set associations
  has_many :games
  has_many :friendships
  has_many :friends, through: :friendships

# set validations 
  validates_presence_of :name
  validates_presence_of :username
  validates_presence_of :password
end
