class SessionsController < ApplicationController
    def new
        
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Loged in successfuly!"
            redirect_to user
        else
            flash.now[:alert] = "there was something wrong. check your email and password!"
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:notice] = "Loged out successfuly!"
        redirect_to root_path
    end
    
    
end