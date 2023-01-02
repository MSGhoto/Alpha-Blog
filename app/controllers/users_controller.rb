class UsersController < ApplicationController
  before_action :set_user, only:[:show,:edit,:update,:destroy]
  before_action :require_user, only:[:edit,:update,:destroy]
  before_action :require_same_user, only:[:edit,:update,:destroy]
    def show
      @article = @user.Articles.paginate(page: params[:page], per_page: 5)
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 5)
    end
    
    
    def new
        @user = User.new
    end

    def edit

    end

    def update

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
          session[:user_id] = @user.id
          flash[:success] = "Wellcome to Alpha Blogs #{@user.username} successfully created"
          redirect_to @user
        else
          flash[:error] = "Something went wrong, account could not be created"
          render 'new'
        end
    end

    def destroy
      
      @user.destroy
      session[:user_id] = nil if @user == current_user
      flash[:alert]="User account and articles are deleted!"
      redirect_to root_path

    end
    
    

    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def require_same_user
      if current_user != @user && !current_user.admin?
        flash[:alert]="You can only change your profile!"
        redirect_to user_path(@user)
      end
    end


end