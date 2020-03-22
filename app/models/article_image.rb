class ArticleImage < ApplicationRecord
  mount_uploader :image, ContentUploader
end
