FactoryGirl.define do
  factory :question do
    text "Test Question"
  end
  factory :invalid_question, parent: :question do
    text nil
  end

  factory :answer do
    text "Test Answer"
  end
  factory :invalid_answer, parent: :answer do
    text nil
    question nil
  end
end
