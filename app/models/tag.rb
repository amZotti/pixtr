class Tag < ActiveRecord::Base
has_many :image_tag_relationships
has_many :images, through: :image_tag_relationships
validates :name, uniqueness: true
end
