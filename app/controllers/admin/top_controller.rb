class Admin::TopController < Admin::Base
  def dash_board
    @articles = Article.all
    @portfolios = Portfolio.all
  end
end
