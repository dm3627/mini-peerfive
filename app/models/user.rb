class User < ApplicationRecord
	has_many :reward_histories, foreign_key: 'given_by'
	validates_presence_of :name
	accepts_nested_attributes_for :reward_histories
end
