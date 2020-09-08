class ArtItem < ActiveRecord::Base
  belongs_to :author, class_name: "User" 
  validates :name, presence: true

end