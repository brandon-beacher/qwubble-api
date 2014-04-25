module Qwubble
  module Resources
    class Registrations < ::Grape::API
      format :json

      resource :registrations do

        desc "Register a device."
        params do
          requires :registration_id, type: String, desc: "The device's registration id."
        end
        post do
          Qwubble::Models::Registration.create(
            registration_id: params[:registration_id])
        end

      end

    end
  end
end