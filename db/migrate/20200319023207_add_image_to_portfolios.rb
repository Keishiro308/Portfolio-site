class AddImageToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :image, :string
  end
end
