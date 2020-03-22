class RemoveThumbnailFromArticles < ActiveRecord::Migration[6.0]
  def change

    remove_column :articles, :thmbnail, :string
    add_column :articles, :thumbnail, :string
  end
end
