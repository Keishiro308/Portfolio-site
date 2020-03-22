class Admin::ArticlesController < Admin::Base
  def index
    @articles = Article.order(published_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    tag_list = params[:tags].split(',')
    if @article.save
      @article.save_tags(tag_list)
      flash.notice = '記事を作成しました。'
      redirect_to :admin_articles
    else
      flash.now.alert = '記事を作成できませんでした。'
      render action: 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash.notice = '記事を更新できました。'
      redirect_to :admin_articles
    else
      flash.now.alert = '記事を更新できませんでした。'
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = '記事を削除しました。'
    redirect_to :admin_articles
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :thumbnail, :published_at, :tags)
  end

end
