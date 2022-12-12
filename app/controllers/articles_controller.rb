class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
        
    end

    def index
        @article = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end
    
    
    def create
        @article = Article.new(params.require(:article).permit(:title,:description))


        if @article.save
            flash[:success] = "Article successfully created"
            redirect_to @article
        else
            flash[:error] = "Something went wrong. Coudn't creat Article"
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title,:description))
            flash[:success] = "Article was Updated Successfully"
            redirect_to @article
        else
            flash[:error] = "Something went wrong. couldn't update Article"
            render 'edit'
        end
        
    end
    
    
    
    
end
