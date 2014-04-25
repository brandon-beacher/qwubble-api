module Qwubble
  module Resources
    class Questions < ::Grape::API
      format :json

      resource :questions do

        desc "Ask a question."
        params do
          requires :registration_id, type: String, desc: "The device's registration id."
          requires :question, type: String, desc: "The user's question."
        end
        post do
          image_url = Qwubble::Searches::GoogleImageSearch.grab_random_image_url(params[:question])
          question = Qwubble::Models::Question.create(
            registration_id: params[:registration_id],
            question:        params[:question],
            image_url:       image_url)
          Qwubble::Notifications::QuestionCreationNotification.new(question).notify
          question
        end

      end

    end
  end
end