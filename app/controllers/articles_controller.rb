class ArticlesController < ApplicationController
  def home
    @article = Article.all.order("likes desc")

  end

  def detail
    @article = Article.find params[:id]

    @comment = Comment.new
    @comment.article = @article
  end

  def likes
    @article = Article.find params[:id]
    @article.update likes: (@article.likes + 1)
    redirect_to root_path
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new params.require(:article).permit(:title, :post, :name, :photo_url)

    if @article.save
      redirect_to article_path(id: @article.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def create_comment
    @article = Article.find_by id: params[:id]
    @comment = Comment.new

    @comment.comment_text = params[:comment][:comment_text]
    @comment.comment_name = params[:comment][:comment_name]
    @comment.article_id = @article.id

    if @comment.save
      redirect_to article_path(id: @article.id)
    else
      render :detail
    end
  end
end
