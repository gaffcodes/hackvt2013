class CommentPollController < PollsController
  before_filter :authorize_legislator!, :except => [:index, :show]
  before_action :set_comment_poll, only: [:show, :edit, :update, :destroy]
  
  def edit
  
  end
  
  def show
	@total_cp = @comment_poll.votes
	@in_favor_cp = @comment_poll.in_favor
	@against_cp = @total_cp - @in_favor_cp 
  end
  
  def index
	@comment_polls = CommentPoll.all
  end
  
  def new
	@comment_poll = CommentPoll.new
  end
  
  def create
    @comment_poll = CommentPoll.new(comment_poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: 'Poll was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment_poll }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment_poll.errors, status: :unprocessable_entity }
      end
    end

  end
  
  def destroy
    @comment_poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url }
      format.json { head :no_content }
    end
  end
  
  def update
    respond_to do |format|
      if @comment_poll.update(comment_poll_params)
        format.html { redirect_to @comment_poll, notice: 'Poll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment_poll.errors, status: :unprocessable_entity }
      end
    end

  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_poll
      @comment_poll = Comment_Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_poll_params
      @params.require(:comment_poll).permit(:comment_id)
    end

end
