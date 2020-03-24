class Visitor::ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    if @article.unpublished?
      redirect_to :visitor_root
    end
  end
end
