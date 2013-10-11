class Vote < ActiveRecord::Base
	attr_writer :poll_id
	belongs_to :poll
end
