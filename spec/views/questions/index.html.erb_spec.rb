require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        :text => "Text"
      ),
      Question.create!(
        :text => "Text"
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
