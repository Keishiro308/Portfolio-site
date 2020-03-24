class Visitor::TopController < ApplicationController
  def index
    if params[:tag]
      @articles = Tag.find(params[:tag]).articles.includes(:tags)
    else
      @articles = Article.order(published_at: :desc).includes(:tags)
    end
  end
end
