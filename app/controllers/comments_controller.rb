class CommentsController < ApplicationController
    before_action :set_article
    before_action :set_comment, only: [:update, :destroy]
    
    def update
        if @comment.update_attributes comment_params
            flash[:success] = "更新に成功しました"
        else
            flash[:error] = "更新に失敗しました"
        end
        redirect_to @article
    end
    
    def create
        if @article.comments.create comment_params
            flash[:success] = "コメントしました"
        else
            flash[:error] = "コメントに失敗しました"
        end
        redirect_to @article
    end
    
    def destroy
        if @comment.destroy
            flash[:success] = "コメントを削除しました"
        else
            flash[:error] = "コメントの削除に失敗しました"
        end
        redirect_to @article
    end
    
    private
        def comment_params
            params.require(:comment).permit(
                :from,
                :body
            )
        end
        
        def set_article
            @article = Article.find(params[:article_id])
        end
        
        def set_comment
            @comment = Comment.find(params[:id])
        end
end
