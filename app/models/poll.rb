class Poll < ActiveRecord::Base
	has_many :votes
	has_many :comments
	has_many :comment_polls, through: :comments

	attr_accessible :bill, :question
end
