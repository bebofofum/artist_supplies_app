class User < ActiveRecord::Base
  has_secure_password
  has_many :artitems, foreign_key: "author_id"

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true



end