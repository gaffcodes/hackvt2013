class BillsController < ApplicationController

	require 'httparty'
	require 'json'

	def show

		@vote = Vote.new
		@vote.bill_id = params[:id]
		unless @poll = Poll.find_by_bill(params[:id])
			@poll = Poll.new
			@poll.bill = params[:id]
			@poll.save!
		end
		@vote.poll_id = @poll.id
		@total_votes = Vote.where("bill_id = '#{params[:id]}'").count
    	@for = Vote.where("bill_id = '#{params[:id]}'").where("in_favor = 't'").count
    	@against = Vote.where("bill_id = '#{params[:id]}'").where("in_favor = 'f'").count

		@uri = "http://openstates.org/api/v1/bills/vt/2013-2014/" + params[:id].gsub('_','%20') + "?apikey=6ecd5cf05848442289647eae66e51a17"
		@results = HTTParty.get("http://openstates.org/api/v1/bills/vt/2013-2014/" + params[:id].gsub('_','%20') + "?apikey=6ecd5cf05848442289647eae66e51a17")
		@title = @poll.bill.gsub('_',' ') + ": " +  JSON.parse(@results.body)["title"].to_s
		@link = JSON.parse(@results.body)["sources"][0]["url"]
		@authors = JSON.parse(@results.body)["sponsors"]
	end

end