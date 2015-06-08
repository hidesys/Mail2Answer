class Member < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
end
