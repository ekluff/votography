require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

  # before :each do
  #   @question = FactoryGirl.create(:answer)
  #   @answer = FactoryGirl.build(:answer)
  #   @answer.question = @question
  #   @answer.save
  # end

  let(:valid_attributes) {
    { text: "valid answer text", question: Question.new(text: "Question text") }
  }

  let(:invalid_attributes) {
    { text: nil, answer: nil }
  }

  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Answer" do
        binding.pry
        expect {
          post :create, {:answer => valid_attributes}, valid_session
        }.to change(Answer, :count).by(1)
      end

      it "assigns a newly created question as @question" do
        post :create, {:answer => valid_attributes, :question => valid_attributes.question.id}, valid_session
        expect(assigns(:answer)).to be_a(Answer)
        expect(assigns(:answer)).to be_persisted
      end

      it "redirects to the created question" do
        post :create, {:answer => valid_attributes}, valid_session
        expect(response).to redirect_to(Answer.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved question as @question" do
        post :create, {:answer => invalid_attributes}, valid_session
        expect(assigns(:answer)).to be_a_new(Answer)
      end

      it "re-renders the 'new' template" do
        post :create, {:answer => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  # @question_attributes = FactoryGirl.attributes_for(:answer, answer_id: @answer)

end
