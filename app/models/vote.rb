class Vote < ActiveRecord::Base
	belongs_to :poll

	scope :in_favor, where("in_favor == 't'")
	scope :against, where("in_favor == 'f'")
end
