class CommentPoll < ActiveRecord::Base
	belongs_to :comment
	
	has_many :votes
	
	attr_accessible :comment_id, :question
end
