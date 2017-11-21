class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @article = Article.all
    end

    def show
        @comment = Comment.new
        @comments = @article.comments.includes(:article)
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new article_params
        if @article.save
            flash[:success] = "作成に成功しました"
            redirect_to :root
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @article.update_attributes article_params
            flash[:success] = "更新に成功しました"
            redirect_to :root
        else
            render  :edit
        end
            
    end

    def destroy
        if @article.destroy
            flash[:success] = "削除に成功しました"
        else
            flash[:error] = "削除に失敗しました"
        end
        redirect_to :root
    end
    
    private
    def set_article
         @article = Article.find(params[:id])
    end
    
    def article_params
        params.require(:article).permit(
            :name,
            :title,
            :content
        )
    end
end
