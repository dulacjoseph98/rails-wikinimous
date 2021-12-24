class ArticlesController < ApplicationController
before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
  
  def show
  end

  def create
    @article = Article.new(article_params)

    if 
      redrect_to @article, notice: "Article was successfull created"
    else
      render :new
    end

  end

  def edit
  end

  def destroy
    @article.destroy
    redirect_to @article, notice: "Article was successfully destroyed"
  end

  def update

    if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully updated"
    else
      render
    end

  end

  private

  def set_article
    @article = Article.find(params[:id])
  end


  def article_params
    params.require(:article).permit(:title, :content)
  end
  
end
