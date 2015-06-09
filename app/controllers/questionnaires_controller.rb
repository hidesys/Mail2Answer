class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]

  # GET /questionnaires
  # GET /questionnaires.json
  def index
    @questionnaires = Questionnaire.all
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
  end

  # GET /questionnaires/new
  def new
    @questionnaire = Questionnaire.new
  end

  # POST /questionnaires
  # POST /questionnaires.json
  def create
    @questionnaire = Questionnaire.new(questionnaire_params[:questionnaire])

    respond_to do |format|
      if @questionnaire.save
        questionnaire_params[:member_ids].each do |member_id|
          next if member_id == ""
          member = Member.find(member_id)
          content = @questionnaire.content.gsub(/\#\{question\((.*?),(.*?)\)\}/) do
            answer = Answer.new(question: $1, question_type: $2)
            answer.url = Answer.get_hex
            answer.member_id = member.id
            answer.questionnaire_id = @questionnaire.id
            answer.save!
            answer_url(answer.url)
          end
          content = content.gsub(/\#\{name\}/, member.name)
          content = content.gsub(/\#\{email\}/, member.email)
          QuestionnaireMailer.question(member, @questionnaire.subject, content).deliver_later
        end
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnaire_params
      params.permit(member_ids: [], questionnaire: [:subject, :content])
    end
end

