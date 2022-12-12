class ArticlesController < ApplicationController
    before_action :set_article,only:[:show,:edit,:update,:destroy]

    def show
        
    end

    def index
        @article = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
       
    end
       
    def create
        @article = Article.new(article_params)

        if @article.save
            flash[:success] = "Article successfully created"
            redirect_to @article
        else
            flash[:error] = "Something went wrong. Coudn't creat Article"
            render 'new'
        end
    end

    def update
        if @article.update(article_params)
            flash[:success] = "Article was Updated Successfully"
            redirect_to @article
        else
            flash[:error] = "Something went wrong. couldn't update Article"
            render 'edit'
        end
        
    end
    
    def destroy
        put "i am in destroy"
        if @article.destroy
            flash[:success] = "Article was successfully deleted."
            redirect_to articles_path
        else
            flash[:error] = "Something went wrong, Couldn't delete artical"
            redirect_to articles_path
        end
    end


    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title,:description)
    end
    
end
