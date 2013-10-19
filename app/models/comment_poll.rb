class CommentPoll < ActiveRecord::Base
	belongs_to :comment
	
	attr_accessible :comment_id, :votes, :in_favor
	
	#against = votes - in_favor
end

#the text of the comment poll is simply the comment itself; all the comment_poll does is record votes
