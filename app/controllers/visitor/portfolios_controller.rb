class Visitor::PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.order(created_at: :desc)
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end
end
