class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @article = @user.Articles.paginate(page: params[:page], per_page: 5)
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end
    
    
    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          flash[:success] = "Account was successfully updated"
          redirect_to @user
        else
          flash[:error] = "Something went wrong, account could not be Updated"
          render 'edit'
        end
    end
    

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "Wellcome to Alpha Blogs #{@user.username} successfully created"
          redirect_to @user
        else
          flash[:error] = "Something went wrong, account could not be created"
          render 'new'
        end
    end
    

    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    
end