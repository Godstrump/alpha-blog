class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @article = Article.all.order("created_at DESC")
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
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

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to articles_path(@article)
    else
      # or :edit
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end
    
  def article_params
    params.require(:article).permit(:title, :description)
  end

end