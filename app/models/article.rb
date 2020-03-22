class Article < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings
  validates :title, presence: true
  validates :content, presence: true
  validates :thumbnail, presence: true
  mount_uploader :thumbnail, ThumbnailUploader

  def self.published_articles
    where('published_at <= ?', DateTime.now)
  end

  def unpublished?
    DateTime.now < published_at
  end

  def save_tags(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_tagname|
      self.tags.delete Tag.find_by(name:old_tagname)
    end

    # Create new taggings:
    new_tags.each do |new_tagname|
      post_tag = Tag.find_or_create_by(name:new_tagname)
      self.tags << post_tag
    end
  end
end
