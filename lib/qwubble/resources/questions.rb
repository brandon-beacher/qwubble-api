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
          Qwubble::Models::Question.create(
            registration_id: params[:registration_id],
            question:        params[:question])
        end

      end

    end
  end
end