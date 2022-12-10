class Bottle < ApplicationRecord
    belongs_to :user
    belongs_to :winery
  
    validates :title, presence: true, uniqueness: true
end
