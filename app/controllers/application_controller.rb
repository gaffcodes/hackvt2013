class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
 
  protected
  def authorize_legislator!
    if user_signed_in? && current_user.type=="l"
      return
    elsif user_signed_in?
      #flash[:notice] = 'You must be a legislator to perform this action'
      #redirect_to :root
      return
    else
      flash[:notice] = 'You need to sign in first'
      redirect_to new_user_session_path
    end
  end
end
