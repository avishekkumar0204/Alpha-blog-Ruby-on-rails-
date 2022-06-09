class ArticlesController < ApplicationController

    def index
        @articles=Article.all
    end


    def show
        @article=Article.find(params["id"])
    end


    def new
        @article=Article.new();
    end


    
    def edit
        @article = Article.find(params[:id])
    end



    def create
       
        @article=Article.new(user_params)
        if @article.save
            flash[:notice] = "This article was saved successfully"
            redirect_to article_path(@article)
        else 
            render "new"
        end
    end



    def update
        @article=Article.find(params[:id])
        
        if @article.update(user_params)
            flash[:notice] = "This article was updated successfully"
            redirect_to article_path(@article)
        else 
            render "edit"
        end
    end


    def destroy
        @article=Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end


    private
        def user_params
            params.require(:article).permit(:title,:desc)
        end


end
