class Answer < ActiveRecord::Base
  belongs_to :question, inverse_of: :answers, dependent: :destroy

  validates :text, :question, presence: true
end
