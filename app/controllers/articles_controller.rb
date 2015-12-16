class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :only=>[:new, :create, :edit]

  def index
    @articles=Article.order('created_at DESC')
  end

  def show
    @article=Article.find(params[:id])
  end

  def new
  end

  def create
    @article=Article.new(article_params)
    @article.author = current_user.username
    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def edit
    @article=Article.find(params[:id])
    if @article.author==current_user.username
      
    else
      @article=Article.find(params[:id])
      @error="You can't edit this post"
      render action: 'show'

    end
  end

  def update
    @article=Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def destroy
    @article=Article.find(params[:id])
    @article.destroy
    redirect_to @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
