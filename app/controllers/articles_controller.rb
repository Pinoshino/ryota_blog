class ArticlesController < ApplicationController
    before_action :set_ariticle
    def index
        @article = Article.all
    end
    def show
        # @article = Ariticle.find(params[:id])
    end
    def new
        @article = Article.new
    end
    def create
        @article = Article.new article_params
        if @article.save
            redirect_to :root
            flash[:success] = "作成に成功しました"
        else
            render :new
        end
    end
    def edit
        @article = Ariticle.find(params[:id])
    end
    def update
        @article = Ariticle.find(params[:id])
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
    def set_ariticle
         @article = Ariticle.find(params[:id])
    end
    
    def article_params
        params.require(:aricle).permit(
            :name,
            :title,
            :content
            )
    end
end
