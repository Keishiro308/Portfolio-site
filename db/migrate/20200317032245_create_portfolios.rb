class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :name, null: false
      t.text :detail

      t.timestamps
    end
  end
end
