class ArticlesController < ApplicationController

  def index
    @article = Article.all.order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to articles_path(@article)
    else
      # or :new
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to articles_path(@article)
    else
      # or :edit
      render 'edit'
    end
  end

  private
    
    def article_params
      params.require(:article).permit(:title, :description)
    end

end