class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(params_new)
        
        if @user.save
             redirect_to user_path(@user[:id])
        else
            render :new
        end
      end
    
    def show
        @user = User.find(params[:id])
        @events = Event.all
    end 

    
    private 

    def params_new
        params.require(:@user123).permit(:username, :name, :email, :password)
    end

end

