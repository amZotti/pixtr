class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments
  has_many :image_tag_relationships
  has_many :tags, through: :image_tag_relationships
  has_many :likes
  has_many :group_images
  has_many :groups, through: :group_images

  validates :url, presence: true
  validates :gallery, presence: true
end
