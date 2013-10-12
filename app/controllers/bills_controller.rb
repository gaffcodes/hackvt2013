class BillsController < ApplicationController

	require 'httparty'
	require 'json'

	def show
		@uri = "http://openstates.org/api/v1/bills/vt/2013-2014/" + params[:id].gsub('_','%20') + "?apikey=6ecd5cf05848442289647eae66e51a17"
		@results = HTTParty.get("http://openstates.org/api/v1/bills/vt/2013-2014/" + params[:id].gsub('_','%20') + "?apikey=6ecd5cf05848442289647eae66e51a17")
	end

end