module Qwubble
  module Resources
    class Answers < ::Grape::API
      format :json

      resource :answers do

        desc "Answer a question."
        params do
          requires :registration_id, type: String, desc: "The device's registration id."
          requires :question_id, type: Integer, desc: "The question being answered."
          requires :answer, type: String, desc: "The answer."
        end
        post do
          image_url = Qwubble::Searches::GoogleImageSearch.grab_random_image_url(params[:answer])
          answer = Qwubble::Models::Answer.create(
            registration_id: params[:registration_id],
            question_id:     params[:question_id],
            answer:          params[:answer],
            image_url:       image_url)
          Qwubble::Notifications::AnswerCreationNotification.new(answer).notify([answer.question.registration_id])
          answer
        end

        desc "Get the answers to a question."
        params do
          requires :question_id, type: Integer, desc: "The question."
        end
        get do
          Qwubble::Models::Answer.where(question_id: params[:question_id])
        end

      end

    end
  end
end