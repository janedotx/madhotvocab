class ApplicationController < ActionController::Base
  before_filter :set_user
  before_filter :require_login, :except => [:index, :signin, :create_user]

  protect_from_forgery

  def index
  end

  def signin
    if User.authenticate(params[:email], params[:password])
    # save in cookie
    @user = User.find_by_screen_name(params[:email])
    session[:user_id] = @user.id
    redirect_to home_path
    end
  end

  def create_user
    puts params.inspect
    # let's pretend no validations problems
    u = User.new
    u.password = params[:password]
    u.email = params[:email]
    u.current_bundle = 0
    if u.save
      render :json => u
    else
      render :json => { :errors => u.errors.messages }
    end
  end
  

  private

  def require_login
    redirect_to root_path if @user.blank?
  end

  def set_user
    @user = User.find(:first)
    session[:user_id] = @user.id
    #return nil if session[:user_id].blank?
    #@user ||= User.find(session[:user_id].to_i)
    # TODO take this shit out 
  end

end

