class Vote < ActiveRecord::Base
	belongs_to :poll

	attr_accessible :poll_id, :email, :zip, :in_favor

	validates_presence_of :email, :zip

	scope :for, where("in_favor == 't'")
	scope :against, where("in_favor == 'f'")

end