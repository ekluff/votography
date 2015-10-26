class Question < ActiveRecord::Base
  has_many :answers, inverse_of: :question

  validates :text, presence: true
end
