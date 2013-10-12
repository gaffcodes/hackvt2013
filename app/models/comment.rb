class Comment < ActiveRecord::Base
	belongs_to :poll
	belongs_to :user
	
	has_many :comment_polls
	
	validates_presence_of :user_email
	
	attr_accessible :user_id, :poll_id, :text, :created_at, :updated_at, :user_email
end
