class CommentPollController < PollsController
  before_filter :authorize_legislator!, :except => [:index, :show]
  before_action :set_poll, only: [:show, :edit, :update, :destroy]
  
  def edit
  end
  
  def show
  end
  
  def index
  end
  
  def new
  end
  
  def create
  end
  
  def destroy
  end
  
  def update
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_poll
      @comment_poll = Comment_Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      @params.require(:comment_poll).permit(:comment_id)
    end

end
