class Visitor::PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.order(created_at: :desc).page(params[:page])
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end
end
