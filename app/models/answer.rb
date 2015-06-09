class Answer < ActiveRecord::Base
  belongs_to :member
  belongs_to :questionnaire
  validates :url, presence: true, uniqueness: true

  def is_bool?
    question_type == "Bool"
  end

  def self.get_hex
      while self.find_by(url: (hex = SecureRandom.hex)) do end
      hex
  end
end
