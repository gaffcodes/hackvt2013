class Vote < ActiveRecord::Base
	belongs_to :poll

	attr_accessible :poll_id, :email, :zip, :in_favor, :bill_id, :user_id

	validates_presence_of :email, :zip

	validates :user_id, :uniqueness => {:scope => :bill_id}

	# scope :for, where("in_favor = 't'")
	# scope :against, where("in_favor = 'f'")

end
