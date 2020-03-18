class AddLinksToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :link, :string
  end
end
