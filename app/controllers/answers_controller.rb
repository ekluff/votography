class AnswersController < ApplicationController
  # GET /questions/new
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
    # binding.pry
  end

  # GET /questions/1/edit
  def edit
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question = params[:question]

    if @answer.save
      redirect_to @answer, notice: 'Answer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      redirect_to @answer, notice: 'Answer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
    redirect_to answers_url, notice: 'Answer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def answer_params
      params.require(:answer).permit(:text, :question_id, :votes)
    end
end
