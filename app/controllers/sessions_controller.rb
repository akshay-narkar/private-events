class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by_username(params_login[:username])
    if @user
      session[:user_id] = @user.id
      #  render plain: session[:username].inspect
      #  render plain: session[:user_id]
      redirect_to root_path, notice: 'Welcome to EventBrite! You have successfully logged in'
    else
      # render plain: "Does not exist"

      render :new, alert: 'User does not exist'
    end
  end

  def show
    # @session = User.find(params[:id])
  end

  def index; end

  def destroy
    #    session[:user_id] = nil
    reset_session
    # render plain: x
    # render  plain: session if session[:id] == params[:id]
    # render plain: params[:id]
    # session[params[:id]] = nil
    # render plain: session[:id]
    redirect_to root_path
  end

  private

  def params_login
    params.require(:@userlogin).permit(:username)
  end
end
