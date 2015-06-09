class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :update]

  # GET /answers/1
  # GET /answers/1.json
  def show
    @title = @answer.question
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    if @answer.update(answer_params)
      render :exit
    else
      render plain: "Error occured."
    end
  end

  def home
    render plain: "#{APPNAME} へようこそ！"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find_by(url: params[:url])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:reply)
    end
end
