class Questionnaire < ActiveRecord::Base
  has_many :answers
  has_many :members, through: :answers
end
