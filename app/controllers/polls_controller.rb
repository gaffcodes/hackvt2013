class PollsController < ApplicationController

  require 'httparty'
  require 'json'

  before_filter :authorize_legislator!, :except => [:index, :show]
  before_action :set_poll, only: [:show, :edit, :update, :destroy]


  # GET /polls
  # GET /polls.json
def index
  @polls = Poll.all
  @titles = []
  @links = []
  @authors = []
  @polls.each do |poll|
    bill = poll.bill.gsub(/[ ]/, '%20')
    @uri = "http://openstates.org/api/v1/bills/vt/2013-2014/" + bill + "?apikey=6ecd5cf05848442289647eae66e51a17"
    @results = HTTParty.get(@uri)
    @titles << JSON.parse(@results.body)["title"].to_s
    @links << JSON.parse(@results.body)["sources"][0]["url"]
    @authors << JSON.parse(@results.body)["sponsors"]
  end
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
    #SHOULD I REALLY BE CREATING A NEW VOTE EVERYTIME I SHOW THE PAGE???!?!?!?!?!?
    @vote = Vote.new
    @vote.poll_id = params[:id]
    @vote.bill_id = @poll.bill
    @vote.user_id = current_user.id if current_user
    @total_votes = Vote.where("bill_id = '#{@poll.bill}'").count
    @for = Vote.where("bill_id = '#{@poll.bill}'").where("in_favor = 't'").count
    @against = Vote.where("bill_id = '#{@poll.bill}'").where("in_favor = 'f'").count
#SR%207/?apikey=7d29214ca63e4afc9fa16a32360679d5
    @uri = "http://openstates.org/api/v1/bills/vt/2013-2014/" + @poll.bill.gsub(/[ ]/,'%20') + "?apikey=7d29214ca63e4afc9fa16a32360679d5"
    @results = HTTParty.get(@uri)
    puts @results
    @title = @poll.bill.gsub(/[_]/,' ') + ": " +  JSON.parse(@results.body)["title"].to_s
    @link = JSON.parse(@results.body)["sources"][0]["url"]
    @authors = JSON.parse(@results.body)["sponsors"]
    
    #display comments somehow
    @comments = Comment.where("poll_id = '#{@poll.id}'")
    
  end

  # GET /polls/new
  def new
    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: 'Poll was successfully created.' }
        format.json { render action: 'show', status: :created, location: @poll }
      else
        format.html { render action: 'new' }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:bill, :question, :creator_id)
    end
end
