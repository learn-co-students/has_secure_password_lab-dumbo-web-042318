class SessionsController < ApplicationController

    def new
        
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            redirect_to new_user_path
        end
    end

    def destroy
        session.destroy
        redirect_to login_path
    end
end
