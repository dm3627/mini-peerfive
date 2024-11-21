class RewardHistory < ApplicationRecord
	belongs_to :user, optional: true
	validates_presence_of :points
end
