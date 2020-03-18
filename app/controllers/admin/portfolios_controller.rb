class Admin::PortfoliosController < Admin::Base
  def index
    @portfolios = Portfolio.order(created_at: :desc)
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      flash.notice = '制作物を追加しました。'
      redirect_to :admin_portfolios
    else
      flash.now.alert = '制作物を追加できませんでした。'
      render action: 'new'
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update(portfolio_params)
      flash.notice = '制作物を更新しました。'
      redirect_to :admin_portfolios
    else
      flash.now.alert = '制作物を更新できませんでした。'
      render action: 'new'
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.destroy
      flash.notice = '制作物を削除しました。'
    else
      flash.now.alert = '制作物を削除できませんでした。'
    end
    redirect_to :admin_portfolios
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:name, :detail, :image, :link)
  end
end
