class Answer < ActiveRecord::Base
  belongs_to :member
  belongs_to :questionnaire
  validates :url, presence: true, uniqueness: true

  def is_bool?
    question_type == "Bool"
  end
end
