class Visitor::TopController < ApplicationController
  def index
    @articles = Article.published_articles.order(created_at: :desc)
  end
end
