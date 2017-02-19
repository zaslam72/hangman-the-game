class Game < ApplicationRecord
# set associations
  belongs_to :user, optional: true 


end
