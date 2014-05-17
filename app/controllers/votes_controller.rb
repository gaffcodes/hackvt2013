class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  #TODO let users see all of their votes, and change their votes
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    unless current_user
      @user = User.new
      @user.email = @vote.email
      @user.save
      current_user = @user
    end

    respond_to do |format|
      if @vote.save
        if @vote.comment_text
          @comment = Comment.new
          @comment.user_email = @vote.email
          @comment.text = @vote.comment_text
          @comment.bill = @vote.bill_id
          @comment.poll_id = @vote.poll_id
          @comment.save
        end
        format.html { redirect_to :back, notice: 'Thanks for your vote!' }
        format.json { render action: 'show', status: :created, location: @vote }
      else
        format.html { redirect_to :back, notice: 'Thanks for your vote!' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:user_id, :in_favor, :email, :zip, :poll_id, :bill_id, :comment_text)
    end
end
