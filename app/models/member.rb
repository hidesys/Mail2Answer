class Member < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true

  def view_for_select
    "#{note}; #{name}; (#{email})"
  end
end
