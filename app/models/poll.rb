class Poll < ActiveRecord::Base
	has_many :votes

	attr_accessible :bill, :question
end
