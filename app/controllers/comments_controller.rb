class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

def index
	@comments = Comment.all
end

def show
	@user = User.find(@comment.user_id)
	@text = @comment.text
	@poll = Poll.find(@comment.poll_id)
	@bill = @poll.bill
	puts @user
	puts "xxx"
	puts @user.name
end

def new
	@comment = Comment.new
end

def create
    @comment = Comment.new(comment_params)
	@comment.user_id = current_user.id
	@comment.poll_id = 1
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
end

def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:poll, :text, :user_id, :user_email, :date)
    end

end
